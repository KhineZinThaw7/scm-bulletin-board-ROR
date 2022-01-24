# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create(name: 'Admin')
Role.create(name: 'User')

User.create(name: 'KZT', email: 'kzt@gmail.com', password: '12345678', role_id: 1)
User.create(name: 'Ma Ma', email: 'mama@gmail.com', password: '12345678', role_id: 2)

Category.create(name: "Travel Blogs")
Category.create(name: "Music Blogs")

Post.create(title: "Favorite Song", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", user_id: 1, category_id: 2)