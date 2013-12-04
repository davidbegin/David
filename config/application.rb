require File.expand_path('../boot', __FILE__)

require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

Bundler.require(:default, Rails.env)

module David
  class Application < Rails::Application
		config.i18n.enforce_available_locales = false 
		config.generators do |g|
			g.helper false
			g.javascripts false
			g.stylesheets false
			g.test_framework false
		end
  end
end
