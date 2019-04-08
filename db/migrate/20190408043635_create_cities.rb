class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :cod_ibge
      t.string :uf

      t.timestamps
    end
  end
end
