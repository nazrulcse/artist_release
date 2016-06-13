# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Music Category

# category = Category.create(name: 'Music')
# category.sub_categories.create(name: 'Rock')
# category.sub_categories.create(name: 'Pop')
# category.sub_categories.create(name: 'Jazz')
# category.sub_categories.create(name: 'R & B')
# category.sub_categories.create(name: 'Hip Hop')
# category.sub_categories.create(name: 'Country')
# category.sub_categories.create(name: 'Christian')
# category.sub_categories.create(name: 'Classical')
# category.sub_categories.create(name: 'Latin')
# category.sub_categories.create(name: 'World Beat')
#
# #Models & Fashions Country
#
# category = Category.create(name: 'Models')
# category.sub_categories.create(name: 'USA')
# category.sub_categories.create(name: 'Asia')
# category.sub_categories.create(name: 'Europe')
# category.sub_categories.create(name: 'South America')
# category.sub_categories.create(name: 'Australia')
# category.sub_categories.create(name: 'Africa')
#
# #Book Country
#
# category = Category.create(name: 'Books')
# category.sub_categories.create(name: 'Mystery')
# category.sub_categories.create(name: 'Children')
# category.sub_categories.create(name: 'Teens')
# category.sub_categories.create(name: 'Biography')
# category.sub_categories.create(name: 'Business')
# category.sub_categories.create(name: 'Education')
# category.sub_categories.create(name: 'Western')
# category.sub_categories.create(name: 'Cookbooks')
# category.sub_categories.create(name: 'Health & Fitness')
# category.sub_categories.create(name: 'Romance')
# category.sub_categories.create(name: 'Religion')
# category.sub_categories.create(name: 'Historical Fiction')
# category.sub_categories.create(name: 'Science Fiction/Fantasy')
# category.sub_categories.create(name: 'Self Help/Psychology')

# bio_text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
#
# Category.top_categories.each do |cat|
#   cat.sub_categories.each do |scat|
#     last_name = [*('a'..'z')].sample(8).join.camelize
#     user = User.new(category_id: cat.id, sub_category_id: scat.id, email: "#{last_name.downcase}@gmail.com", password: '123456789', city: 'Dhaka', estate: 'Dhaka', country: 'Bangladesh', address: 'Test Address, #45, road', first_name: 'Mr.', last_name: last_name)
#     user.bio = bio_text
#     if cat.name.downcase == 'music'
#       user.band = 'band'
#       user.role = 'vocal'
#       user.how_long_play = '3 hours'
#     end
#
#     if cat.name.downcase == 'models'
#       user.how_long_perform = '5 hours'
#       user.age = 35
#     end
#
#     if cat.name.downcase == 'bookss'
#       user.how_long_write = '10 Years'
#     end
#     user.save
#   end
# end
#
# User.all.each do |user|
#   user.events.create(title: 'Sample artist event #1', location: 'Denver, CO', date: '2016-06-31 23:07', description: bio_text)
#   user.events.create(title: 'Sample artist event #2', location: 'Tulsa, OK', date: '2016-06-24 23:07', description: bio_text)
#   user.events.create(title: 'Sample artist event #3', location: 'Dhaka, BD', date: '2016-06-12 23:07', description: bio_text)
# end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')