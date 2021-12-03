class CreateMoneyGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :budget_groups do |t|
      t.references :group, null: false, foreign_key: true
      t.references :money_track, null: false, foreign_key: true

      t.timestamps
    end
  end
end
