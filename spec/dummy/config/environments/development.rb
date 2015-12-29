if Rails::VERSION::STRING.to_f == 4.0
  application = Dummy::Application
else
  application = Rails.application
end

application.configure do
  config.secret_key_base = "foo"

  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  javascripts_dir = Rails.root.join("../../spec/javascripts")

  File.open(javascripts_dir.join("spec_helper.js"), "r") do |f|
    f.each_line do |line|
      match = line.match(%r{\A//= require (?<file_path>.+)\n\z})
      if match
        path_to_precompile = "#{match['file_path']}.self.js"
        Rails.application.config.assets.precompile << path_to_precompile
      end
    end
  end

  Dir[javascripts_dir.join("**/*.js")].each do |path|
    path_to_precompile = Pathname.new(path).relative_path_from(javascripts_dir).to_s.sub(/\.js\z/, ".self.js")
    Rails.application.config.assets.precompile << path_to_precompile
  end
end
