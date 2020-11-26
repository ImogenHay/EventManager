class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.belongs_to :location, foreign_key: true
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
