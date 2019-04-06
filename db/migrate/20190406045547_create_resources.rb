class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :name
      t.string :model_type
      t.integer :model_id

      t.timestamps
    end
  end
end
