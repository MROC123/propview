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
# Reviews.destroy_all
Property.destroy_all
Manager.destroy_all
User.destroy_all

managers_address = ["42 Kingsway, London WC2B 6EY", "5 Queensway London W2 3RX", "188 York Rd, London SW11 3JZ", "372 King St, London W6 0RX", "47 Portman Towers, George St, London W1H 7HW" ]
properties_address = ["375 Park Road London NW10 3JR", "25 Grove Rd Bushwood, London E11 3AN", "150 High St, London E15 2NE", "Thomas Frye Court, 30 High St, London E15 2PS", "125 Red Lion Rd, Surbiton KT6 7QR", "64 Lawrie Park Rd, London SE26 6DN", "22 Palmer St, London SW1H 0PH", "99 Park Ln, London W1K 7TH", "159 Brick Ln, London E1 6SB", "10 Ellen St, London E1 1PE", "47 Leman St, London E1 8EN" ]

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
    address: managers_address.sample,
    user: manager_user,
    user_id: manager_user.id
  )
  managers << manager
end

property_types = ["Apartment", "House", "Semi-Detached", "Terrace", "Studio"]

properties = []
10.times do
  property = Property.create!(
    name: Faker::Address.community,
    address: properties_address.sample,
    property_type: property_types.sample,

    bedrooms: rand(1..5).to_s,
    bathrooms: rand(1..3).to_s,
    manager: managers.sample,
    user: users.sample
  )
  properties << property
  puts "Seeded Property '#{property.name}' with #{property.bedrooms} bedrooms."

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
