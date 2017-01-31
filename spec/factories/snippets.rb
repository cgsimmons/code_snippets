FactoryGirl.define do
  factory :snippet do
    sequence(:title){|n| "#{Faker::Hipster.sentence(3)} #{n}"}
    code      Faker::StarWars.quote
    description Faker::Company.bs
    language
  end
end
