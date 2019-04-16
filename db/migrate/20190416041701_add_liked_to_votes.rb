class AddLikedToVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :liked, :boolean
  end
end
