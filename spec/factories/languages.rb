FactoryGirl.define do
  factory :language do
    sequence(:name) { |n| "#{Faker::Company.name} #{n}" }
  end
end
