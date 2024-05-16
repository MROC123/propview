# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

# Clear existing records
Property.destroy_all
Manager.destroy_all
User.destroy_all
Bedroom.destroy_all

# Create users
users = []
5.times do
  users << User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

# Create managers
managers = []
5.times do
  managers << Manager.create!(
    address: Faker::Address.full_address,
    user: users.sample
  )
end

# Define property and bedroom types
property_types = ['Apartment', 'House', 'Condo', 'Studio']

# Helper method to generate a list of bedroom types based on the number of bedrooms
def generate_bedroom_types(num_bedrooms)
  all_bedroom_types = ['Master', 'Double', 'Single', 'Kids']
  types = []
  remaining_bedrooms = num_bedrooms

  if remaining_bedrooms >= 1
    types << 'Master'
    remaining_bedrooms -= 1
  end

  if remaining_bedrooms >= 1
    types << 'Double'
    remaining_bedrooms -= 1
  end

  while remaining_bedrooms > 0
    types << all_bedroom_types.sample
    remaining_bedrooms -= 1
  end

  types.shuffle # Shuffle to randomize the order of types
end

# Create properties with random bedroom configurations
properties = []
10.times do
  num_bedrooms = rand(1..5)
  bedroom_types_list = generate_bedroom_types(num_bedrooms)

  property = Property.create!(
    name: Faker::Address.community,
    address: Faker::Address.full_address,
    property_type: property_types.sample,
    bedrooms: num_bedrooms,
    bathrooms: rand(1..3).to_s,
    manager: managers.sample
  )

  # Create bedroom records for the property
  bedroom_types_list.each do |type|
    Bedroom.create!(
      property: property,
      bedroom_type: type
    )
  end

  properties << property
  puts "Seeded Property '#{property.name}' with #{num_bedrooms} bedrooms."
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
