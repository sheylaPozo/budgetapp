# frozen_string_literal: true

class Budget < ApplicationRecord
  belongs_to :user
  has_many :budgetgroups, dependent: :destroy
  has_many :groups, through: :budget_groups, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
