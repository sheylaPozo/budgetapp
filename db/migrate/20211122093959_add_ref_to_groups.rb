class AddRefToGroups < ActiveRecord::Migration[6.1]
  def change
    add_reference :groups, :budget, null: false, foreign_key: true
  end
end
