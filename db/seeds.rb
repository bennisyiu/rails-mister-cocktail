# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cocktail.destroy_all

require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Ordinary_Drink'
drinks = JSON.parse(open(url).read)
drinks_arr = drinks.values[0]
drinks_arr.each_with_index { |c, index|
  Cocktail.create!(name: drinks_arr[index]["strDrink"], category: ['Vodka', 'Gin', 'Rum', 'Bourbon', 'Scotch', 'Whiskey', 'Tequila', 'Brandy', 'Other'].sample, photo: drinks_arr[index]["strDrinkThumb"])
  puts "cocktail#{index} created!"
}
