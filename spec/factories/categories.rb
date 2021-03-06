# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Category#{n}" }
    icon { Faker::Company.logo }
    user
  end
end
