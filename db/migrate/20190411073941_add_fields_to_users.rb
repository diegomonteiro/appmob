class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reputation, :float
    add_column :users, :address, :text
  end
end
