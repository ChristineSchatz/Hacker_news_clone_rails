# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
  { username: "Alina", password: "12345"},
  { username: "Anna", password: "12345"},
  { username: "Zack", password: "1234"},
  { username: "George", password: "123"},
]

posts = [
   { title: "The Web’s Cruft Problem", body: "Blah blah blah blah", user_id: 1},
   { title: "Finnish Defence Forces Cyber Challenge", body: "Blah blah blah blah", user_id: 2},
   { title: "Finnish Defence Forces Cyber Challenge", body: "Blah blah blah blah", user_id: 4},
   { title: "Estimate the cost of a Web, iOS or Android app", body: "Blah blah blah blah", user_id: 3}
]

users.each do |user|
  User.create(user)
end

posts.each do |post|
  Post.create(post)
end
