require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TaxiBye
  class Application < Rails::Application
    
      # Set bower components path and precompile type
      config.assets.paths << Rails.root.join("vendor","assets","bower_components")
      config.assets.precompile += %w(.svg .eot .woff .ttf .woff2 .otf)

      # Set timezone
      config.time_zone = 'Taipei'
      config.active_record.default_timezone = :local

      # Set locale
      config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
      config.i18n.default_locale = "zh-TW"
      config.i18n.available_locales = [:"zh-TW", :en]

      # Set generator
      config.generators do |g|
        g.orm :active_record
        g.view_specs false
        g.routing_specs false
        g.helper_specs false
        g.request_specs false
        g.assets false
        g.helper false
      end
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
