class Treaty < ApplicationRecord
  belongs_to :user, foreign_key: :author_id, class_name: 'User'
  validates :name, presence: true, uniqueness: { scope: :author_id, message: 'already taken by you' },
                   length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :categories, presence: true
  has_and_belongs_to_many :categories
end
