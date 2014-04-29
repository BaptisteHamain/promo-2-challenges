require_relative "../config/application"
require_relative "../models/post"
require_relative "../models/user"
require 'open-uri'
require 'nokogiri'

# Seed you database with post data from hacker news
# And fake users using Faker gem

puts "Seeding database..."

User.destroy_all
Post.destroy_all

#TODO: Your code goes here
# 1. create fake users
users = []
5.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email)
  users << user
end

# 2. Scrape news from https://news.ycombinator.com/ and associate posts to your existing users

response = open("https://news.ycombinator.com/")

doc = Nokogiri::HTML(response) #:: signifie que l'on se situe dans le sous-module HTML de Nokogiri

doc.search('td.title>a').each do |element|
x = element.parent.parent.next_sibling
  if x != nil
    y = x.search("td.subtext>span").first
    if y != nil
      Post.create({
       name: element.inner_text,
       date: Time.now,
       source_url: element['href'],
       user: users.sample,
       rating: y.inner_text
      })
    end
  end
end
