# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Example User",
             email: "boa",
             password: "foobar",
             password_confirmation: "foobar")

users = User.order(:created_at).take(6)

50.times do |num|
  User.create(name: "UserID#{num}",
              email: "example#{num}@rails.com",
              password: "foobar#{num}",
              password_confirmation: "foobar#{num}")
end

50.times do |num|
  Board.create(title: "ID#{num}",
               content: "掲示板#{num}",
               user_id: "1")
end
