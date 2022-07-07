# Load the Rails application.
require_relative "application"

ActionMailer::Base.default_content_type = "text/html"

# Initialize the Rails application.
Rails.application.initialize!

config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'example.com',
  user_name:            '<username>',
  password:             '<password>',
  authentication:       'plain',
  enable_starttls_auto: true  
}
