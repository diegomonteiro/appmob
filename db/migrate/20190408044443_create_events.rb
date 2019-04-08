class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :description
      t.float :lat
      t.float :lon
      t.belongs_to :city, foreign_key: true
      t.integer :event_type
      t.json :event_files
      t.belongs_to :user, foreign_key: true
      t.integer :event_status

      t.timestamps
    end
  end
end
