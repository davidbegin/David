ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'
require 'simplecov'
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
	config.include Warden::Test::Helpers
	config.include FactoryGirl::Syntax::Methods
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
end

SimpleCov.start
Warden.test_mode!

def controller_sign_in
	allow_message_expectations_on_nil
	admin = double('admin')
	request.env['warden'].stub :authenticate! => admin
	controller.stub :current_admin => admin
end
