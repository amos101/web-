#coding: utf-8

30.times do |n|
  name = Faker::Name.name
  email = "sample-#{n+2}@email.com"
  password = "password"
  User.create!(
    name: name,
    email: email,
    password: password
  )
end  