# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create({
    name: "Quique",
    cellphone: "4426097151",
    email: "quique@gmail.com",
    password: "quique",
    role: "Administrator"
})

User.create({
    name: "Usuario1",
    cellphone: "442468498",
    email: "usuario1@gmail.com",
    password: "usuario1",
    role: "User"
}) 
