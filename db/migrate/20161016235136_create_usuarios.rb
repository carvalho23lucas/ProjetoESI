class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.string :documento
      t.string :nome
      t.string :email
      t.string :senha
      t.references :cidade, foreign_key: true
      t.boolean :isPJ
      t.boolean :isInstituicao

      t.timestamps
    end
  end
end
