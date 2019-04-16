class CreateEventResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :event_responses do |t|
      t.belongs_to :event, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.text :description
      t.integer :event_status

      t.timestamps
    end
  end
end
