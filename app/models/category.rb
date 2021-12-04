# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :budgets
  validates :name, presence: true, uniqueness: { scope: :user_id, message: 'already taken by you' },
                   length: { maximum: 50 }
  validates :icon, presence: true, uniqueness: true

  before_validation :remove_whitespace

  def budgets_with_user
    budgets
  end

  def total_amount
    budgets.sum(:amount)
  end

  private

  def remove_whitespace
    self.name = name.strip unless name.nil?
    self.icon = icon.strip unless icon.nil?
  end
end
