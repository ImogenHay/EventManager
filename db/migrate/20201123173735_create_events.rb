class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.belongs_to :location, foreign_key: true, null: false
      t.string :type
      t.date :date, null: false
      t.text :description
      t.time :start
      t.time :end
      t.integer :tickets
      t.decimal :price

      t.timestamps
    end
  end
end
