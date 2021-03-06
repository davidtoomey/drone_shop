class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 12, scale: 3
      t.string :image_url
      t.boolean :active

      t.timestamps null: false
    end
  end
end
