# frozen_string_literal: true

class BudgetGroup < ApplicationRecord
  belongs_to :group
  belongs_to :budget
end
