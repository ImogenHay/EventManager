class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name, null:false
      t.text :description
      t.string :country, null:false
      t.string :street, null:false
      t.string :postcode, null:false

      t.timestamps
    end
  end
end
