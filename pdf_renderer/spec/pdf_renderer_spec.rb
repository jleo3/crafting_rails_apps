require 'spec_helper'

describe "pdf_renderer" do
  it "should have pdf mime attributes" do
    Mime::PDF.to_sym.should == :pdf
    Mime::PDF.to_s.should == "application/pdf"
  end
end
