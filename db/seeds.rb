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
  { username: "Daniel", password: "12345"},
  { username: "Jerry", password: "12345"},
  { username: "Michelle", password: "12345"}
].each { |user| User.create(user) }

posts = [
   { title: "N8VEM – Homebrew Computing Project", body: "http://hermann.io/sofia.cremin", user_id: 6, votes: 0},
   { title: "OS X Command Line Utilities", body: "http://hermann.io/sofia.cremin", user_id: 2, votes: 0},
   { title: "The Web’s Cruft Problem", body: "http://hermann.io/sofia.cremin", user_id: 1, votes: 0},
   { title: "Can we ever really know another person?", body: "http://hermann.io/sofia.cremin", user_id: 7, votes: 0},
   { title: "Finnish Defence Forces Cyber Challenge", body: "http://hermann.io/sofia.cremin", user_id: 5, votes: 0},
   { title: "How to learn data science", body: "http://hermann.io/sofia.cremin", user_id: 3, votes: 0},
   { title: "The psychedelic state in light of integrated information theory", body: "http://hermann.io/sofia.cremin", user_id: 4, votes: 0},
   { title: "Diet Advice That Ignores Hunger", body: "http://hermann.io/sofia.cremin", user_id: 1, votes: 0},
   { title: "Estimate the cost of a Web, iOS or Android app", body: "http://hermann.io/sofia.cremin", user_id: 3, votes: 0},
   { title: "Pyxley: Python Powered Dashboards", body: "http://hermann.io/sofia.cremin", user_id: 4, votes: 0},
   { title: "RethinkDB 2.1 beta: automatic failover with Raft", body: "http://hermann.io/sofia.cremin", user_id: 5, votes: 0}
].each { |post| Post.create(post) }

# users.each do |user|
#   User.create(user)
# end

# posts.each do |post|
#   Post.create(post)
# end
