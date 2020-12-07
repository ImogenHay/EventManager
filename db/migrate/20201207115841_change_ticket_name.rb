class ChangeTicketName < ActiveRecord::Migration[5.2]#had to change tickets column since tickets is now a seperate table
  def change
    rename_column :events, :tickets, :num_tickets
  end
end
