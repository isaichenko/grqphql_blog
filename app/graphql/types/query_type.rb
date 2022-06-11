module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :user, Types::UserType, null: true,
      description: "Returns one User instance" do 
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    field :post, Types::PostType, null: true,
      description: "Returns one Post instance" do 
      argument :id, ID, required: true
    end

    def post(id:)
      Post.find(id)
    end

    field :comment, Types::CommentType, null: true,
      description: "Returns one Comment instance" do 
      argument :id, ID, required: true
    end

    def comment(id:)
      Comment.find(id)
    end

  end
end
