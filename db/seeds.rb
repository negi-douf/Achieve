# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

33.times do |n|
  email = Faker::Internet.email
  password = "password"
  name = Faker::Name.first_name
  
  User.create!(
    email: email,
    password: password,
    password_confirmation: password,
    name: name)
end


34.times do |n|
  email = Faker::Internet.email
  password = "password"
  name = Faker::Zelda.character
  
  User.create!(
    email: email,
    password: password,
    password_confirmation: password,
    name: name)
end


33.times do |n|
  email = Faker::Internet.email
  password = "password"
  name = Faker::Pokemon.name
  
  User.create!(
    email: email,
    password: password,
    password_confirmation: password,
    name: name)
end


100.times do |n|
  title = Faker::Lorem.sentence
  content = Faker::Lorem.sentence
  
  Blog.create!(
    title: title,
    content: content,
    user_id: Faker::Number.between(1, 100) )
end
