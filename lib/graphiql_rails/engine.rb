require "react-rails"

module GraphiqlRails
  class Engine < ::Rails::Engine
    isolate_namespace GraphiqlRails

    initializer "static assets" do |app|
      app.config.assets.precompile += %w(
        graphiql_rails/graphiql-0.4.5.css
        graphiql_rails/graphiql-0.4.5.js
        graphiql_rails/graphiql-0.4.4.css
        graphiql_rails/graphiql-0.4.4.js
      )
    end
  end
end
