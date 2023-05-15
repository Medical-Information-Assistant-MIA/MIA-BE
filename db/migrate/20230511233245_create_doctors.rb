# frozen_string_literal: true

class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.references :condition, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.string :phone
      t.string :type

      t.timestamps
    end
  end
end
