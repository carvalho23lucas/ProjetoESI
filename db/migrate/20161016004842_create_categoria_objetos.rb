class CreateCategoriaObjetos < ActiveRecord::Migration[5.0]
  def change
    create_table :categoria_objetos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
