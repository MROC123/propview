# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

Property.destroy_all
Manager.destroy_all
User.destroy_all

users = []
5.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: "password",
    password_confirmation: "password"
  )
  users << user
end

managers = []
5.times do
  manager_user = users.sample
  manager = Manager.create!(
    name: Faker::Name.name,
    address: Faker::Address.full_address,
    user: manager_user,
    user_id: manager_user.id
  )
  managers << manager
end

property_types = ["Apartment", "House", "Condo", "Studio"]

properties = []
10.times do
  user = users.sample
  property = Property.create!(
    name: Faker::Address.community,
    address: Faker::Address.full_address,
    property_type: property_types.sample,
    bedrooms: rand(1..5),
    bathrooms: rand(1..3),
    manager: managers.sample,
    user_id: user.id
  )

  properties << property
  puts "Seeded Property #{property.name}"
end

puts "Seed data created successfully!"

# 20.times do
#   review = Review.new(
#     pros: Faker::Lorem.sentence(word_count: 20),
#     cons: Faker::Lorem.sentence(word_count: 20),
#     advice: Faker::Lorem.sentence(word_count: 15),
#     rating: rand(1..10),
#     start_date: Faker::Date.between(from: 10.years.ago, to: 2.years.ago),
#     end_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
#     service_charge: Faker::Commerce.price(range: 30..500),
#     rent: Faker::Commerce.price(range: 500..4000),
#     location: Faker::Address.full_address,
#     user: users.sample,
#     manager: managers.sample
#   )


#   review.property = properties.sample if [true, false].sample
#   review.save!
# end
