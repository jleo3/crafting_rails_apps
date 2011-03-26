require 'spec_helper'
require 'fixtures/sample_mail'

describe "MailForm" do
  context "attr setting, getting, and deleting" do
    before(:each) do
      @sample = SampleMail.new
    end

    it "should have name and email as attributes" do
      @sample.name = "User"
      @sample.email = "user@example.com"

      @sample.name.should eql "User"
      @sample.email.should eql "user@example.com"
    end

    it "should clear attributes using a clear_ prefix" do
      @sample.name = "User"
      @sample.email = "user@example.com"

      @sample.clear_name
      @sample.clear_email

      @sample.name.should be_nil
      @sample.email.should be_nil
    end

    it "should tell us whether an attribute is present" do
      @sample.name?.should be_false

      @sample.name = "User"

      @sample.name?.should be_true
      @sample.email?.should be_false
    end

    it "should validate the absence of nickname" do
      @sample.nickname = "nothing valid"
      @sample.should_not be_valid
      @sample.errors[:nickname].should eql ["is invalid"]
    end
  end

  context "making deliveries" do
    before(:each) do
      ActionMailer::Base.deliveries.clear
      @sample = SampleMail.new
    end

    it "should deliver an email with attributes" do
      @sample.email = "user@example.com"
      @sample.deliver

      ActionMailer::Base.deliveries.size.should eql 1
      mail = ActionMailer::Base.deliveries.last

      mail.from.should eql ["user@example.com"]
      mail.body.encoded.should match /Email: user@example\.com/
    end

    it "should provide before and after hooks" do
      @sample.deliver
      @sample.callbacks.should eql [:before, :after]
    end
  end
end
