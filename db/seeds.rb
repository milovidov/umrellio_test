# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = []
posts_ids = []
user_ips = []

(1..254).each do |number|
user_ips.push "192.168.0.#{number}"
end

body_length = 100

(1..100).each do |number|
  user = User.create login: "user#{number}"
  users.push user
end

(1..200000).each do |number|
  user = users.sample
  post = user.posts.create title: "title#{number}", body: [*('A'..'Z')].sample(body_length).join, ip: user_ips.sample

  rate = rand(1.0..5.0)
  count = rand(1..1000000)

  Rate.create post_id: post.id, count: count, rate: rate
  posts_ids.push post.id
end



