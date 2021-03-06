IWillWorkForGumbo::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb
  config.eager_load = false
  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.default_url_options = { :host => "localhost:3000" }
  # Gmail SMTP server setup
ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :enable_starttls_auto => true,
    :port => 587,
    :authentication => :plain,
    :user_name => "iWillWorkForGumbo@gmail.com",
    :password => "$%uu91td%$"
  }

  config.paperclip_defaults = {
    :storage => :s3,
    :s3_credentials => {
      :bucket => ENV['AWS_BUCKET'],
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
  }

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict


  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
end
