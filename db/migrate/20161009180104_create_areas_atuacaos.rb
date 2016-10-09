class CreateAreasAtuacaos < ActiveRecord::Migration[5.0]
  def change
    create_table :areas_atuacaos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
