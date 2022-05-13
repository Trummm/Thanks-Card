require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ThanksCard
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.serve_static_assets = true

    config.action_mailer.delivery_method = :smtp
    host = 'localhost:3000'
    config.action_mailer.default_url_options = { host: host }
    ActionMailer::Base.smtp_settings = {
      address: 'smtp.gmail.com',
      port: '587',
      authentication: :plain,
      user_name: ENV['GMAIL_USERNAME'],
      password: ENV['GMAIL_PASSWORD'],
      enable_starttls_auto: true
    }


    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
