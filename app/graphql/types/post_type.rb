class Types::PostType < Types::BaseObject

	description "One post"

	field :id, ID, null: false
	field :user_id, Int, null: false
	field :body, String, null: true 

	field :comments, [Types::CommentType], null: true, description: "Returns all Post's comments"

end