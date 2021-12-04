FactoryBot.define do
  sequence(:email) { |n| "email#{n}@test.com" }
  factory :user do
    name { 'name' }
    email
    password { 'password' }
    password_confirmation { 'password' }

    factory :with_categories do
      transient do
        categories_count { 3 }
      end

      after(:create) do |user, evaluator|
        create_list(:category, evaluator.categories_count, user: user)
      end
    end
  end
end
