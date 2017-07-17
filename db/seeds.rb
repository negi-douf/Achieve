# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |n|
  title = Faker::Lorem.sentence
  content = Faker::Lorem.sentence
  user_id = Faker::Number.between(1, 101)
  
  Blog.create!(title: title, 
    content: content,
    user_id: user_id)
end
