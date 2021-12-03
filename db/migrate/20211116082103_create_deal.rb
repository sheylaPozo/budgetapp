class CreateDeal < ActiveRecord::Migration[6.1]
  def change
    create_table :deal do |t|
      t.string :name
      t.decimal :amount
      t.references :author, references: :user, null: false, foreign_key: { to_table: :user }

      t.timestamps
    end
  end
end
