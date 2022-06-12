module Types
  class MutationType < Types::BaseObject
    
    # Users
    field :create_user, Types::UserType, mutation: Mutations::CreateUser

    field :update_user, Boolean, null: false, description: "Update user" do 
      argument :user, Types::UserInputType, required: true
    end

    def update_user(user:)
      existing = User.find(user[:id])
      existing.update user.to_h
    end

    field :delete_user, Boolean, null: false, description: "Delete user" do 
      argument :id, ID, required: true
    end

    def delete_user(id:)
      User.find(id).destroy
      true
    end

    # Posts
    field :create_post, Types::PostType, mutation: Mutations::CreatePost

    field :update_post, Boolean, null: false, description: "Update post" do 
      argument :post, Types::PostInputType, required: true
    end

    def update_post(post:)
      existing = Post.find(post[:id])
      existing.update post.to_h
    end

    field :delete_post, Boolean, null: false, description: "Delete post" do 
      argument :id, ID, required: true
    end

    def delete_post(id:)
      Post.find(id).destroy
      true
    end

    # Comments
    field :create_comment, Types::CommentType, mutation: Mutations::CreateComment

    field :update_comment, Boolean, null: false, description: "Update comment" do 
      argument :comment, Types::CommentInputType, required: true
    end

    def update_comment(comment:)
      existing = Comment.find(comment[:id])
      existing.update comment.to_h
    end

    field :delete_comment, Boolean, null: false, description: "Delete comment" do
      argument :id, ID, required: true
    end

    def delete_comment(id:)
      Comment.find(id).destroy
      true
    end

  end
end
