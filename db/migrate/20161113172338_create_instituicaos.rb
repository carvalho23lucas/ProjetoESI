class CreateInstituicaos < ActiveRecord::Migration[5.0]
  def change
    create_table :instituicaos do |t|
      t.references :area_atuacao, foreign_key: true
      t.string :documento
      t.string :nome
      t.string :email
      t.string :senha
      t.string :codigo
      t.references :cidade, foreign_key: true

      t.timestamps
    end
  end
end
