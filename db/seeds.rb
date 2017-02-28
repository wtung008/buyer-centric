# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create!(name: "Electronics", description: 'The branch of physics and technology concerned with the design of circuits using transistors and microchips, and with the behavior and movement of electrons in a semiconductor, conductor, vacuum, or gas.')
Category.create!(name: "Furniture", description: 'Large movable equipment, such as tables and chairs, used to make a house, office, or other space suitable for living or working.')
Category.create!(name: "Fashion", description: 'A popular trend, especially in styles of dress and ornament or manners of behavior.')
Category.create!(name: "Leisure", description: 'Use of free time for enjoyment.')
