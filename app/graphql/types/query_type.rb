module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

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

    field :login, String, null: true, description: "Login a user" do 
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def login(email:, password:)
      if user = User.where(email: email).first&.authenticate(password)
        user.sessions.create.key
      end
    end

    field :current_user, Types::UserType, null: true, description: "The currently logged in user"

    def current_user
      context[:current_user]
    end

    field :logout, Boolean, null: false, description: "Logout a user"

    def logout
      Session.where(id: context[:session_id]).destroy_all
      true
    end

  end
end
