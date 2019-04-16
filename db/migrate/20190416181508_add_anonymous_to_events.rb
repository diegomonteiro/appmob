class AddAnonymousToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :anonymous, :boolean
  end
end
