# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Loading current database'
puts '...'
puts 'Emptying database ...'
Restaurant.destroy_all
puts 'Data base is now empty. Preparing new entries.'

100.times do
  @restaurant = Restaurant.new
  @restaurant.name = Faker::Restaurant.name
  @restaurant.address = Faker::Address.street_address
  @restaurant.phone_number = Faker::PhoneNumber.cell_phone_in_e164
  @restaurant.category = ['chinese', 'italian', 'Japanese', 'french', 'belgian'].sample
  @restaurant.save
end

@restaurants = Restaurant.all
@restaurants.each do |r|
  puts "#{r.id} - #{r.name} #{r.address} #{r.category}"
end

puts 'Successfully added 100 fake entries to the database'
