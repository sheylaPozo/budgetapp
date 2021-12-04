# frozen_string_literal: true

FactoryBot.define do
  factory :budget do
    sequence(:name) { |n| "Budget #{n}" }
    amount { 10 }
    user
  end
end
