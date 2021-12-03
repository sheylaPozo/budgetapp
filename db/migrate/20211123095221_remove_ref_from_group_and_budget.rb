class RemoveRefFromGroupAndBudget < ActiveRecord::Migration[6.1]
  def change
    remove_column :groups, :budget_id
    remove_column :budgets, :group_id
  end
end
