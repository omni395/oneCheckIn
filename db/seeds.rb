# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
r1 = Role.create({ name: 'Admin', description: 'Can perform any CRUD operation on any resource' })
r2 = Role.create({ name: 'Manager', description: 'Can read and create items. Can update and destroy own items' })
r3 = Role.create({ name: 'Operator', description: 'Can read items' })

User.create(id: 0, email: 'admin@example.com', password: '12345678', password_confirmation: '12345678', role_id: r1.id)
User.create(id: 1, email: 'manager@example.com', password: '12345678', password_confirmation: '12345678', role_id: r3.id)
User.create(id: 2, email: 'operator1@example.com', password: '12345678', password_confirmation: '12345678', role_id: r2.id)
User.create(id: 3, email: 'operator2@example.com', password: '12345678', password_confirmation: '12345678', role_id: r2.id)
