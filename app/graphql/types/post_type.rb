class Types::PostType < Types::BaseObject

	description "One post"

	field :id, ID, null: false
	field :user_id, Int, null: false
	field :body, String, null: true 

	field :comments, [Types::CommentType], null: true, description: "Returns all Post's comments"

	field :errors, [Types::ErrorType], null: true

	def errors
		object.errors.map { |e| { field_name: e.attribute, errors: object.errors[e.attribute] } }
	end

  class Types::PostInputType < GraphQL::Schema::InputObject
		graphql_name "PostInputType"
		description "All the attributes needed to create/update post"

		argument :id, ID, required: false
		argument :user_id, Int, required: false
		argument :body, String, required: false
	end

end