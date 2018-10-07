# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create users and roles
User.create!(name: "admin", password: "654321", email: "admin@test.com", location: "Taipei")
User.create!(name: "user1", password: "123456", email: "user1@test.com", location: "Hsinchu")

Role.destroy_all
Role.create!(name: "admin")
Role.create!(name: "user")

# Set roles to all users
admin_role = Role.find_by(name: "admin")
user_role = Role.find_by(name: "user")

users = User.all
users.each do |u|
  u.roles = [user_role]
end

admin_user = User.find_by(email: "admin@test.com")
admin_user.roles.append(admin_role)

# Set Labels
Label.create!(name: "Language")
Label.create!(name: "Self-Improvement")
Label.create!(name: "Movies")
Label.create!(name: "Open Source")
Label.create!(name: "Video Games")
Label.create!(name: "Culture Exchange")
Label.create!(name: "International Friends")
Label.create!(name: "Fitness")
Label.create!(name: "Foodie")
Label.create!(name: "Dining Out")

# Add random instrest labels to all users
users = User.all
users.each do |u|
  u.labels = Label.all.sample(rand(Label.all.length))
end

puts
puts "Seed data generated"
