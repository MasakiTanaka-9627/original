User.create(name: "ExampleUser",
    email: "admin@rails.com",
    profile: "adminprofile",
    password: "foobaradmin",
    password_confirmation: "foobaradmin"
   )

5.times do |num|
User.create(name: "TestUserID#{num}",
     email: "example#{num}@rails.com",
     password: "foobartest#{num}",
     profile: "Testprofile#{num}",
     password_confirmation: "foobartest#{num}")
end
