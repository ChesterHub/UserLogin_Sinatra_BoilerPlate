require 'faker'


20.times do |user|
	User.create(username: Faker::Name.name, email: Faker::Internet.email, password: "yes")
	end