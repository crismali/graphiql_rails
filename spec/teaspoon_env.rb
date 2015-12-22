Teaspoon.configure do |config|
  config.mount_at = "/teaspoon"
  config.root = GraphiqlRails::Engine.root
  config.asset_paths = ["spec/javascripts", "spec/javascripts/stylesheets"]
  config.driver = :selenium
  config.color = true

  config.suite do |suite|
    suite.use_framework :mocha, "2.3.3"
    suite.matcher = "{spec/javascripts,app/assets}/**/*_spec.js"
    suite.helper = "spec_helper"
  end
end
