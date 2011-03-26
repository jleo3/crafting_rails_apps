module HelperMethods
  RSpec.configure do |config|
    config.before(:each) do
      Capybara.reset_sessions!
      if example.options[:js]
        Capybara.current_driver = :selenium
      end
    end

    config.after(:each) do
      if example.options[:js]
        Capybara.use_default_driver
      end
    end
  end
end
RSpec.configuration.include HelperMethods, :type => :acceptance
