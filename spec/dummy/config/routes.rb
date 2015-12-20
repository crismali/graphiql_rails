Rails.application.routes.draw do
  post "/graphql", controller: :graphql, action: :graphql
  mount GraphiqlRails::Engine => "/graphiql_rails"
end
