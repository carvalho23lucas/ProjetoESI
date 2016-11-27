class CreateObjetos < ActiveRecord::Migration[5.0]
  def change
    create_table :objetos do |t|
      t.references :categoria_objeto, foreign_key: true
      t.string :nome
      t.string :unidade_medida
      t.integer :meta
      t.string :observacoes

      t.timestamps
    end
  end
end
