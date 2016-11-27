class CreateDoacaos < ActiveRecord::Migration[5.0]
  def change
    create_table :doacaos do |t|
      t.references :usuario, foreign_key: true
      t.references :objeto, foreign_key: true
      t.integer :quantidade
      t.string :observacoes

      t.timestamps
    end
  end
end
