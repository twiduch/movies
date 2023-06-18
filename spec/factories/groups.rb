FactoryBot.define do
  factory :group do
    name { 'name' }
    description { 'description' }
    user { nil }

    trait :with_user do
      user
    end
  end
end
