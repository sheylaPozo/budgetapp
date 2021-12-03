class AddRefToGroup < ActiveRecord::Migration[6.1]
  def change
    add_reference :group, :budget, null: false, foreign_key: true
  end
end
