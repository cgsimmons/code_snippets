FactoryGirl.define do
  factory :snippet do
    sequence(:title){|n| "#{Faker::Hipster.sentence(3)} #{n}"}
    work      Faker::StarWars.quote
    kind
  end
end
