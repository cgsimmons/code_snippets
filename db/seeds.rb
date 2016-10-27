# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

10.times do |i|
  Language.create(name: "#{Faker::Company.name} #{i}")
end
puts "Seeded Languages"

50.times do |i|
  Snippet.create(title: Faker::Hipster.sentence(3, true, 2),
                 work: Faker::Lorem.paragraph(2),
                 language: Language.order("RANDOM()").first)
end
puts "Seeded Snippets"
