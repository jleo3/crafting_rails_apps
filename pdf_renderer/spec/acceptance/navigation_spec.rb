require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')
include Rails.application.routes.url_helpers

feature "Navigation of Home Controller" do

  scenario "pdf request sends a pdf as file" do
    visit home_path
    click_link 'PDF'

    headers['Content-Transfer-Encoding'].should eql('binary')
    headers['Content-Disposition'].should eql('attachment; filename="contents.pdf"')
    headers['Content-Type'].should eql('application/pdf')
    page.body.should match /Prawn/
  end

  scenario "pdf renderer uses a specified template" do
    visit '/another.pdf'

    headers['Content-Transfer-Encoding'].should eql('binary')
    headers['Content-Disposition'].should eql('attachment; filename="contents.pdf"')
    headers['Content-Type'].should eql('application/pdf')
    page.body.should match /Prawn/
  end
    
  protected
  def headers
    page.response_headers
  end
end
