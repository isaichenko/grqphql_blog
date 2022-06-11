class Types::UserType < Types::BaseObject

	description "One user"

	field :id, ID, null: false
	field :first_name, String, null: true
	field :last_name, String, null: true 
	field :street, String, null: true
	field :number, Int, null: true
	field :city, String, null: true 
	field :postcode, Int, null: true
	field :country, String, null: true

	field :posts, [Types::PostType], null: true, description: "Returns all Users's posts"

	field :address, String, null: true

	#def address
	#	"#{object.street}, #{object.number}, #{object.postcode}, #{object.country}"
	#end

	def address
    ([:street, :number, :postcode, :country].map do |a|
      object.send(a)&.strip
    end.compact - ['']).join(', ')
  end

end