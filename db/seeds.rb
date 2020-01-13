# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

4.times do |n|
  name = Faker::Name.name
  email = "hogehoge#{n+1}@example.com"
  password = "password"
  Account.create!(email: email,password: password)
end

users = Account.all

#20.times do |n|
#  message = Faker::Lorem.sentence
#  users.each {|user| user.messages.create!(message: message)}
#end
