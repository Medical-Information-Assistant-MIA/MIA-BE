class CreateHealthEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :health_events do |t|
      t.references :condition, null: false, foreign_key: true
      t.text :note
      t.date :date
      t.integer :type

      t.timestamps
    end
  end
end
