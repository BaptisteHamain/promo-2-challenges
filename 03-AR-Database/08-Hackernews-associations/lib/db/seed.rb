require './config/application'
require 'faker'

require './models/user'
require './models/post'

# Seed you database with recipe data from marmiton
puts "Seeding database..."

User.destroy_all
Post.destroy_all

# creates users with the Faker Gem
5.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email)

  3.times do
    user.posts.create(name: Faker::Lorem.sentence(4), date: Time.now,
                      source_url: Faker::Internet.url, rating: rand(10))
  end

end