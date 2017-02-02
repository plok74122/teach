# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Group.create(:name => 'Ruby')
Group.create(:name => 'PHP')
Group.create(:name => '.NET')

Category.create(:name => 'C1')
Category.create(:name => 'C2')
Category.create(:name => 'C3')