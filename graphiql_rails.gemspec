$LOAD_PATH.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "graphiql_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "graphiql_rails"
  s.version     = GraphiqlRails::VERSION
  s.authors     = ["Michael Crismali"]
  s.email       = ["michael@crismali.com"]
  s.homepage    = "https://github.com/crismali/graphiql_rails"
  s.summary     = "Provides Graphiql integration in Rails"
  s.description = "Provides a configurable Graphiql endpoint for easy graphql api development."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.0.0"
  s.add_dependency "react-rails", ">= 1.5.0"

  s.add_development_dependency "appraisal"
  s.add_development_dependency "rubocop"
  s.add_development_dependency "dotenv-rails"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "coffee-rails"
  s.add_development_dependency "graphql"
  s.add_development_dependency "capybara"
  s.add_development_dependency "selenium-webdriver"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "teaspoon-mocha"
  s.add_development_dependency "pry-byebug"
  s.add_development_dependency "pry-rails"
end
