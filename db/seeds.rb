# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "ExampleUser",
             email: "admin@rails.com",
             profile: "adminprofile",
             password: "foobaradmin",
             password_confirmation: "foobaradmin"
            )

5.times do |num|
  User.create!(name: "TestUserID#{num}",
              email: "example#{num}@rails.com",
              password: "foobartest#{num}",
              profile: "Testprofile#{num}",
              password_confirmation: "foobartest#{num}")
end

5.times do |user|
  5.times do |num|
    Board.create!(title: "BoardID:#{num}",
                content: "掲示板#{num}_#{user}",
                user_id: 1)
  end
end

Tag.create([
  { name: 'タグ1' },
  { name: 'タグ2' },
  { name: 'タグ3' },
  { name: 'タグ4' },
  { name: 'タグ5' }
])

