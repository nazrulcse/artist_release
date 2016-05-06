# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Music Category

category = Category.create(name: 'Music')
category.sub_categories.create(name: 'Rock')
category.sub_categories.create(name: 'Pop')
category.sub_categories.create(name: 'Jazz')
category.sub_categories.create(name: 'R & B')
category.sub_categories.create(name: 'Hip Hop')
category.sub_categories.create(name: 'Country')
category.sub_categories.create(name: 'Christian')
category.sub_categories.create(name: 'Classical')
category.sub_categories.create(name: 'Latin')
category.sub_categories.create(name: 'World Beat')

#Models & Fashions Country

category = Category.create(name: 'Models')
category.sub_categories.create(name: 'USA')
category.sub_categories.create(name: 'Asia')
category.sub_categories.create(name: 'Europe')
category.sub_categories.create(name: 'South America')
category.sub_categories.create(name: 'Australia')
category.sub_categories.create(name: 'Africa')

#Book Country

category = Category.create(name: 'Books')
category.sub_categories.create(name: 'Mystery')
category.sub_categories.create(name: 'Children')
category.sub_categories.create(name: 'Teens')
category.sub_categories.create(name: 'Biography')
category.sub_categories.create(name: 'Business')
category.sub_categories.create(name: 'Education')
category.sub_categories.create(name: 'Western')
category.sub_categories.create(name: 'Cookbooks')
category.sub_categories.create(name: 'Health & Fitness')
category.sub_categories.create(name: 'Romance')
category.sub_categories.create(name: 'Religion')
category.sub_categories.create(name: 'Historical Fiction')
category.sub_categories.create(name: 'Science Fiction/Fantasy')
category.sub_categories.create(name: 'Self Help/Psychology')