class Types::UserType < Types::BaseObject

	description "One user"

	field :id, ID, null: false
	field :email, String, null: true
	field :is_superadmin, Boolean, null: true
	field :first_name, String, null: true
	field :last_name, String, null: true 
	field :street, String, null: true
	field :number, Int, null: true
	field :city, String, null: true 
	field :postcode, Int, null: true
	field :country, String, null: true

	field :posts, [Types::PostType], null: true, description: "Returns all Users's posts"

	field :full_name, String, null: true
	def full_name
		"#{object.first_name} #{object.last_name}"
	end

	field :address, String, null: true
	def address
    ([:street, :number, :postcode, :country].map do |a|
      object.send(a).to_s&.strip
    end.compact - ['']).join(', ')
  end

  field :errors, [Types::ErrorType], null: true
	def errors
		object.errors.map { |e| { field_name: e.attribute, errors: object.errors[e.attribute] } }
	end

	# Authorization visible
	def self.visible?(context)
		!!context[:current_user]
	end

  class Types::UserInputType < GraphQL::Schema::InputObject
		graphql_name "UserInputType"
		description "All the attributes needed to create/update user"

		argument :id, ID, required: false
		argument :email, String, required: false
		argument :is_superadmin, Boolean, required: false
		argument :first_name, String, required: false
		argument :last_name, String, required: false
		argument :street, String, required: false
		argument :number, Int, required: false
		argument :city, String, required: false 
		argument :postcode, Int, required: false
		argument :country, String, required: false
	end

end