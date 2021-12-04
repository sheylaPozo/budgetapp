class CreateCategoriesAndBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :icon, null: false
      t.datetime :created_at, null: false
      t.references :user, null: false, foreign_key: true
    end

    create_table :budgets do |t|
      t.string :name
      t.decimal :amount
      t.references :author, references: :users, null: false, foreign_key: { to_table: :users }
      t.datetime :created_at, null: false
    end

    create_table :categories_budgets do |t|
      t.belongs_to :category
      t.belongs_to :budget
      t.timestamps
    end
  end
end