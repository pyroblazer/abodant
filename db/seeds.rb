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

User.create!([{
  first_name: 'Admin', 
  last_name: 'Admin', 
  email: 'admin@abodant.com',
  password: 'password', 
  is_hunter: 0, 
  is_realtor: 0, 
  is_admin: 1,
  phone: '1800-MY-ADMIN',
  contact_method: 'text',
}])

User.create!([{
  first_name: 'realtor', 
  last_name: 'x', 
  email: 'realtor@abodant.com',
  password: 'password', 
  is_hunter: 0, 
  is_realtor: 1, 
  is_admin: 0,
  phone: '1800-MY-REALTOR',
  contact_method: 'text',
  company_id: Faker::Number.between(from: 1,to: 10)
}])

User.create!([{
  first_name: 'hunter', 
  last_name: 'y', 
  email: 'hunter@abodant.com',
  password: 'password', 
  is_hunter: 1, 
  is_realtor: 0, 
  is_admin: 0,
  phone: '1800-MY-HUNTER',
  contact_method: 'text'
}])

10.times do
  Company.create(
    name: Faker::Company.name,
    website: Faker::Internet.url,
    address: Faker::Address.full_address,
    size: Faker::Number.between(from: 0, to: 4),
    year_founded: Faker::Number.between(from: 1900, to: 2023),
    revenue: Faker::Number.between(from: 0, to: 3),
    synopsis: Faker::Company.bs()
  )
end

50.times do
  Property.create(
    address: Faker::Address.full_address,
    size: Faker::Number.between(from: 1000, to: 50000),
    style: Faker::Number.between(from: 0, to: 1),
    company_id: Faker::Number.between(from: 1, to: 10),
    created_by: Faker::Number.between(from: 1, to: 20),
    floors: Faker::Number.between(from: 0, to: 4),
    owner: Faker::Name.name,
    year_built: Faker::Number.between(from: 1950, to: 2023),
    price: Faker::Number.between(from: 100000, to: 5000000)
  )
end

20.times do
  User.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    email: Faker::Internet.email,
    password: 'password', 
    is_hunter: Faker::Boolean.boolean, 
    is_realtor: Faker::Boolean.boolean, 
    is_admin: 0,
    phone: Faker::PhoneNumber.phone_number,
    contact_method: 'email',
    company_id: Faker::Number.between(from: 1, to: 10)
  )
end
