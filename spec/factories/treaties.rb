# frozen_string_literal: true

FactoryBot.define do
  factory :treaty do
    sequence(:name) { |n| "Treaty #{n}" }
    amount { 10 }
    user
  end
end
