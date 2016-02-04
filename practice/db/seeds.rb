# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include RandomData

10.times do
  User.create!(
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end

users = User.all

50.times do
  Post.create!(
    user: users.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

posts = Post.all

50.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_sentence,
    user: users.sample
  )
end

comments = Comment.all

puts "Seed is finished."
puts "#{User.count} users created."
puts "#{Post.count} posts created."
puts "#{Comment.count} comments created."
