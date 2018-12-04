# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

dates = [Date.new, Date.new + 1, Date.new + 3, Date.new - 1, Date.new + 2]
company = ['Apple', 'Google', 'Facebook', 'Amazon', 'Microsoft']
cost = [10, 100, 200, 400, 123]
quantity = [20, 30, 300, 250, 400]

random = Random.new

35.times do
  Investment.create(date_created: dates[random.rand(0..4)],
                    date_of_trade: dates[random.rand(0..4)],
                    company: company[random.rand(0..4)],
                    cost: cost[random.rand(0..4)],
                    quantity: quantity[random.rand(0..4)])
end
