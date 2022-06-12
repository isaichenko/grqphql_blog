class Types::CommentType < Types::BaseObject

	description "One comment"

	field :id, ID, null: false
	field :post_id, Int, null: false
	field :body, String, null: true

	field :errors, [Types::ErrorType], null: true

	def errors
		object.errors.map { |e| { field_name: e.attribute, errors: object.errors[e.attribute] } }
	end

  class Types::CommentInputType < GraphQL::Schema::InputObject
		graphql_name "CommentInputType"
		description "All the attributes needed to create/update comment"

		argument :id, ID, required: false
		argument :post_id, Int, required: false
		argument :body, String, required: false
	end

end