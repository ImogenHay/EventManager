class ChangeColumnName < ActiveRecord::Migration[5.2] #had to change name of type since type is built in funbction
  def change
    rename_column :events, :type, :event_type
  end
end
