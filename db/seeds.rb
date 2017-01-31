# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])

# 10.times do |i|
#   Language.create(name: "#{Faker::Company.name} #{i}")
# end

Language.create(name: 'clojure')
Language.create(name: 'coffee')
Language.create(name: 'csharp')
Language.create(name: 'css')
Language.create(name: 'django')
Language.create(name: 'elixir')
Language.create(name: 'elm')
Language.create(name: 'html')
Language.create(name: 'java')
Language.create(name: 'javascript')
Language.create(name: 'markdown')
Language.create(name: 'mysql')
Language.create(name: 'objectivec')
Language.create(name: 'perl')
Language.create(name: 'pgsql')
Language.create(name: 'php')
Language.create(name: 'plain_text')
Language.create(name: 'python')
Language.create(name: 'ruby')
Language.create(name: 'rust')
Language.create(name: 'sass')
Language.create(name: 'scss')
Language.create(name: 'swift')
puts "Seeded Languages"

50.times do |i|
  Snippet.create(title: Faker::Hipster.sentence(3, true, 2),
                 code: Faker::Lorem.paragraph(2),
                 description: Faker::Company.bs,
                 language: Language.order("RANDOM()").first)
end
puts "Seeded Snippets"
