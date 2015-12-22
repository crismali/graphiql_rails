require "graphql"

class Specified
  def something_specific
    "real specific"
  end
end

SpecifiedType = GraphQL::ObjectType.define do
  name "Specified"
  description "A Specified thing"

  field :something_specific, !types.String
end

SpecifiedQueryType = GraphQL::ObjectType.define do
  name "Query"
  description "Super specified"

  field :specified do
    type SpecifiedType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Specified.new }
  end
end

SpecifiedEndpointSchema = GraphQL::Schema.new(query: SpecifiedQueryType)
