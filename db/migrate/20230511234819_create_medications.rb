# frozen_string_literal: true

class CreateMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :medications do |t|
      t.references :condition, null: false, foreign_key: true
      t.string :name
      t.date :date_prescribed
      t.string :dosage
      t.string :frequency
      t.string :prescribed_by

      t.timestamps
    end
  end
end
