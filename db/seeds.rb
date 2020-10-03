# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "open-uri"
require "nokogiri"


Dose.delete_all
Ingredient.delete_all
Cocktail.delete_all
html_content = open("https://www.makemycocktail.com/?#HowToMakeACocktail")

doc = Nokogiri::HTML(html_content)

pagination = doc.search('.w3-card label')

pagination.each do |element|
  Ingredient.create(name: element.children.text)
end


html_content = open("https://www.1001cocktails.com/recettes/selection_cocktails-sans-alcool.aspx")

doc = Nokogiri::HTML(html_content)

pagination = doc.search('.recipe-card__title')

pagination.each do |element|
  Cocktail.create(name: element.text)
end

