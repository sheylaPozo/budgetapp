# frozen_string_literal: true

class CreateGroup < ActiveRecord::Migration[6.1]
  def change
    create_table :group do |t|
      t.string :name
      t.string :icon
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
