class AddUsersToTickets < ActiveRecord::Migration[5.2]

  def up
    add_reference :tickets, :user, index: true #add field
    Ticket.reset_column_information
    user = User.first #all existing tickets given to first user

    Ticket.all.each do |ticket| #populate field
      ticket.user_id = user.id
      ticket.save!
    end

    change_column_null :tickets, :user_id, false #chnage to not allow nulls
    add_foreign_key :tickets, :users #add foreign keys
  end

  def down
    remove_foreign_key :tickets, :users #removes column and foreign key
    remove_reference :tickets, :user, index: true
  end

end
