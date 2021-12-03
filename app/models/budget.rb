# frozen_string_literal: true

class Budget < ApplicationRecord
  belongs_to :user
  has_many :budget_groups, dependent: :destroy
  belongs_to :group, through: :budget_groups

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
