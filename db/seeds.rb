# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  age = rand(1..100)
  Patient.create(name: Faker::Name.name, phone_number: Faker::PhoneNumber.phone_number, age: age, address: Faker::Address.full_address)
end