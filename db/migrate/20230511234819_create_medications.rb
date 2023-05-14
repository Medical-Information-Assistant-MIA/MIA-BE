# frozen_string_literal: true

class CreateMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :medications do |t|
      t.references :condition, null: false, foreign_key: true
      t.string :name
      t.string :pseudonym
      t.date :date_prescribed
      t.string :dosage
      t.string :frequency
      t.boolean :as_needed
      t.string :prescribed_by

      t.timestamps
    end
  end
end
