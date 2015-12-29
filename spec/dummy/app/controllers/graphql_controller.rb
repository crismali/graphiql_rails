class GraphqlController < ApplicationController
  skip_before_action :verify_authenticity_token
  def graphql
    render json: GraphqlSchema.execute(params[:query], variables: params[:variables])
  end

  def graphql_specified
    render json: SpecifiedEndpointSchema.execute(params[:query], variables: params[:variables])
  end
end
