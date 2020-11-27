class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.belongs_to :location, foreign_key: true, null:false
      t.text :description
      t.integer :rating, null:false

      t.timestamps
    end
  end
end
