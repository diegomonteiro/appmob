class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.jsonb :actions, default: {}
      t.references :permissible, polymorphic: true, index: true
      t.references :recursive, polymorphic: true, index: true
      t.timestamps
    end
  end
end
