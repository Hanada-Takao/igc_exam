# require 'faker'
50.times do |n|
  # name = Faker::Games::Pokemon.name
  # email = Faker::Internet.email
  # password = "password"
  name = "name#{n}"
  email = "email#{n}@example.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               )
end