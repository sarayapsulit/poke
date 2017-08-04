class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name, null: false
      t.string :element
      t.string :pic
      t.integer :health
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
