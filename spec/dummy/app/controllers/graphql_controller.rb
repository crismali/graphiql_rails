class GraphqlController < ApplicationController
  skip_before_action :verify_authenticity_token
  def graphql
    render json: GraphqlSchema.execute(params[:query])
  end

  def graphql_specified
    render json: SpecifiedEndpointSchema.execute(params[:query])
  end
end
