class CreateMoneyTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :money_tracks do |t|
      t.string :name
      t.integer :amount
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
