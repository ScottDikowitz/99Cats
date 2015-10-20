# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create!(birth_date: Date.new(1991,12,06), color: "grey", name: "Paprika", sex: "M", description: "Friendly")
Cat.create!(birth_date: Date.new(1992,05,21), color: "black", name: "Pepper", sex: "F", description: "Mean")
Cat.create!(birth_date: Date.new(1999,07,03), color: "white", name: "Sennacy", sex: "M", description: "Jerk")
Cat.create!(birth_date: Date.new(2005,12,04), color: "white", name: "Ginger", sex: "F", description: "Neutral")
Cat.create!(birth_date: Date.new(2009,11,05), color: "orange", name: "Friskey", sex: "M", description: "Generous")
