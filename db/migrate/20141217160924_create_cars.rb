class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :year, null: false
      t.string :make, null: false
      t.string :model, null: false
      t.decimal :price, precision: 8, scale: 2, null: false
      t.string :color, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
