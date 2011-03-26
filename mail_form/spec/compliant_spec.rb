require 'spec_helper'
require 'fixtures/sample_mail'

describe 'MailForm' do
  before(:each) do
    @sample = SampleMail.new
  end

  it "should expose singular and human name via model_name" do
    @sample.class.model_name.human.should eql "Sample mail"
    @sample.class.model_name.singular.should eql "sample_mail"
  end

  it "should have a human method that uses I18n" do
    begin
      I18n.backend.store_translations :en,
        :activemodel => { :models => { :sample_mail => "My Sample Mail" } }

      @sample.class.model_name.human.should eql "My Sample Mail"
    ensure
      I18n.reload!
    end
  end

  it "should retrieve all attributes values" do
    @sample.name = "John Doe"
    @sample.email = "john.doe@example.com"

    @sample.attributes["name"].should eql "John Doe"
    @sample.attributes["email"].should eql "john.doe@example.com"
  end
end
