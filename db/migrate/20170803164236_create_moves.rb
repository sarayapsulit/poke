class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :name, null: false
      t.string :element
      t.integer :attack_power
      t.references :pokemon, foreign_key: true

      t.timestamps
    end
  end
end
