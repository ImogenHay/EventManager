class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.belongs_to :event, foreign_key: true, null:false
      t.string :first_name, null:false
      t.string :last_name, null:false
      t.integer :age, null:false

      t.timestamps
    end
  end
end
