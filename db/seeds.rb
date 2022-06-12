# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(first_name: 'Bob',
						last_name: 'Diligan',
						street: 'Timesquer',
						number: 50,
						city: 'New York',
						postcode: 32098,
						country: 'USA')

User.create(first_name: 'Carl',
						last_name: 'Bobkins',
						street: 'Derebasovska',
						number: 10,
						city: 'Odessa',
						postcode: 45836,
						country: 'Ukraine')

User.create(first_name: 'Brad',
						last_name: 'Wilkins',
						street: 'Greatstreet',
						number: 3,
						city: 'Warshava',
						postcode: 52392,
						country: 'Poland')

Post.create(user_id: 1, body: "Great first post of first User")
Post.create(user_id: 1,	body: "Great second post of first User")
Post.create(user_id: 1, body: "One more of first User")
Post.create(user_id: 2, body: "Great first post of 2 User")
Post.create(user_id: 2,	body: "Great second post of 2 User")
Post.create(user_id: 2,	body: "One more of 2 User")
Post.create(user_id: 3,	body: "Great first post of 3 User")
Post.create(user_id: 3,	body: "Great second post of 3 User")
Post.create(user_id: 3,	body: "One more of 3 User")

Comment.create(post_id: 1, body: "Intresting")
Comment.create(post_id: 1, body: "wow")
Comment.create(post_id: 1, body: "Great!")
Comment.create(post_id: 2, body: "I want more")
Comment.create(post_id: 2, body: "Boring")
Comment.create(post_id: 2, body: "Next time do your best")
Comment.create(post_id: 3, body: "Amaizing")
Comment.create(post_id: 3, body: "Not good")
Comment.create(post_id: 3, body: "Bad, very bad")

User.create email: 'a@b.c', password: '1', password_confirmation: '1', is_superadmin: true, first_name: 'Super', last_name: "Admin"