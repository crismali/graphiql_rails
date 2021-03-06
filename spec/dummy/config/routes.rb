Rails.application.routes.draw do
  post "/graphql", controller: :graphql, action: :graphql
  post "/graphql_specified", controller: :graphql, action: :graphql_specified

  mount GraphiqlRails::Engine => "/graphiql_rails", defaults: { endpoint: "/graphql" }
  mount GraphiqlRails::Engine => "/graphiql_rails_specified",
        as: :specified_graphiql_rails,
        defaults: {
          endpoint: "/graphql_specified",
          version: "0.4.4"
        }
end
