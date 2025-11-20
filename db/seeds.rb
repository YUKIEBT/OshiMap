# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "admin@test.com", password: "password")


#if Rails.env.development?
  (1..10).each do |n|
    user = User.create!(
      name: Faker::Name.name,
      email: "user_#{n}@test.com",
      password: "password")
    (0..rand(0..5)).each do |m|
      user.posts.create!(
        address: Faker::Address.city,
        title: Faker::Lorem.word,
        body: Faker::Lorem.sentence(word_count: rand(3..10))
      )
    end
  end
#end
