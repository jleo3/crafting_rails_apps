require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Navigation of root" do
  before(:each) do
    ActionMailer::Base.deliveries.clear
  end

  scenario "I send an email after filling the contact form" do
    visit '/'

    fill_in "Name", :with => "John Doe"
    fill_in "Email", :with => "john.doe@example.com"
    fill_in "Message", :with => "I'm going to watch you die screaming.  Am I lying?"
    
    click_button "Deliver"

    page.body.should match "Your message was successfully sent."

    ActionMailer::Base.deliveries.size.should eql 1
    mail = ActionMailer::Base.deliveries.last

    mail.from.should eql ["john.doe@example.com"]
    mail.to.should eql ["recipient@example.com"]
    mail.body.encoded.should match /die screaming/
  end

  scenario "A bot tries to send an email" do
    visit "/"

    fill_in "Nickname", :with => "I am a bot"

    fill_in "Name", :with => "John Doe"
    fill_in "Email", :with => "john.doe@example.com"
    fill_in "Message", :with => "I'm going to watch you die screaming.  Am I lying?"
    
    click_button "Deliver"
    ActionMailer::Base.deliveries.size.should eql 0
  end
end
