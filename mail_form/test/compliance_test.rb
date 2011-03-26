require 'test_helper'
require File.dirname(__FILE__) + '/../spec/fixtures/sample_mail'

class ComplianceTest < ActiveSupport::TestCase
  include ActiveModel::Lint::Tests

  def setup
    @model = SampleMail.new
  end
end
