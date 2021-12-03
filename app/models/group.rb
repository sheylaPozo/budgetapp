# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :user
  has_many :budget_groups, dependent: :destroy
  has_many :budgets, through: :budget_groups, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }

  def add_budget(options)
    budget = budget.create!(name: options[:name], amount: options[:amount], user: options[:user])
    budgets << budge
    budget
  end
end
