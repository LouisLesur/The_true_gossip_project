# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.delete_all
City.delete_all
Gossip.delete_all
Tag.delete_all
Comment.delete_all

10.times do |index|
  City.create(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip,
  )
end

10.times do |index|
  User.create(
    first_name: Faker::GreekPhilosophers.name,
    last_name: "the wise",
    email: Faker::Internet.email,
    age: rand(18..50),
    description: Faker::Books::Lovecraft.paragraphs,
    city_id: City.find(rand(City.first.id..City.last.id)).id
  )
end


20.times do |index|
  Gossip.create(
    title: Faker::Lorem.word,
    content: Faker::GreekPhilosophers.quote,
    user_id: User.find(rand(User.first.id..User.last.id)).id
  )
end

10.times do |index|
  Tag.create(
    title: Faker::Creature::Animal.name
  )
end

10.times do |index|
  Comment.create(
    content: Faker::SlackEmoji.emoji,
    user_id: User.find(rand(User.first.id..User.last.id)).id,
    gossip_id: Gossip.find(rand(Gossip.first.id..Gossip.last.id)).id
  )
end

10.times do |index|
    LinkTagGossip.create(
      gossip_id: Gossip.find(rand(Gossip.first.id..Gossip.last.id)).id,
      tag_id: Tag.find(rand(Tag.first.id..Tag.last.id)).id
    )
end
