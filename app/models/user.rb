# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, dependent: :destroy
  has_many :budgets, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { maximum: 30 }
end
