class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :treaties
  validates :name, presence: true, uniqueness: { scope: :user_id, message: 'already taken by you' },
                   length: { maximum: 50 }
  validates :icon, presence: true, uniqueness: true

  before_validation :remove_whitespace

  def treaties_with_user
    treaties
  end

  def total_amount
    treaties.sum(:amount)
  end

  private

  def remove_whitespace
    self.name = name.strip unless name.nil?
    self.icon = icon.strip unless icon.nil?
  end
end
