# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User and role seed data
User.create!(id: 0, name: "admin", password: "654321", email: "admin@test.com")
User.create!(id: 1, name: "user1", password: "123456", email: "user1@test.com")

Role.create!(id: 0, name: "admin")
Role.create!(id: 1, name: "user")

RoleRecord.create!(user_id: 0, role_id: 0)
RoleRecord.create!(user_id: 0, role_id: 1)
RoleRecord.create!(user_id: 1, role_id: 1)

