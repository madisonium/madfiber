Madfiber::Application.configure do
  config.cache_classes = false
  config.whiny_nils = true

  config.consider_all_requests_local       = true
  config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = false

  ActionMailer::Base.send(:include, ActionController::UrlFor) if defined?(ActionController)

  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
end
