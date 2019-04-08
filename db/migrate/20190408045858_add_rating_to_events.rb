class AddRatingToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :votes_up, :integer
    add_column :events, :votes_down, :integer
  end
end
