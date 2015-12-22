require "graphql"

class Post
  def initialize(id)
    @id = id
  end

  def id
    @id
  end

  def title
    "The Wackiest #{id}"
  end

  def body
    "a wacky blog post #{id}"
  end
end

class Comment
  def initialize(id)
    @id = id
  end

  def id
    @id
  end

  def author_id
    12
  end

  def body
    "a wacky comment #{id} by #{author_id}"
  end
end

PostType = GraphQL::ObjectType.define do
  name "Post"
  description "A blog post"

  field :id, !types.ID
  field :title, !types.String
  field :body, !types.String
end

CommentType = GraphQL::ObjectType.define do
  name "Comment"
  description "A comment"

  field :id, !types.ID
  field :author_id, !types.ID
  field :body, !types.String
end

QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema. Pretty sweet, right?"

  field :post do
    type PostType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Post.new(args["id"]) }
  end

  field :comment do
    type CommentType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Comment.new(args["id"]) }
  end
end

GraphqlSchema = GraphQL::Schema.new(query: QueryType)
