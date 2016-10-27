FactoryGirl.define do
  factory :kind do
    sequence(:name) { |n| "#{Faker::Company.name} #{n}" }
  end
end
