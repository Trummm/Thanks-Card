require_relative "boot"

require "rails/all"
Bundler.require(*Rails.groups)

module ThanksCard
  class Application < Rails::Application
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
  end
end
