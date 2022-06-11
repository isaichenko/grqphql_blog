class Types::CommentType < Types::BaseObject

	description "One post"

	field :id, ID, null: false
	field :post_id, Int, null: false
	field :body, String, null: true 

end