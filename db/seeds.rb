# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


categories = Category.create([{ name: 'Biuro'}])

statuses = Status.create([{ name: 'Oczekuje'}, {name: 'Zrobione'}])

users = User.create([{ name: 'Patryk', surname: 'Kątek', email: 'patryk.katek@put.poznan.pl', password: 'Robak1990', admin: '1'}])