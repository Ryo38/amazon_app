class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :sku
      t.string :asin
      t.text :title
      t.string :condition
      t.float :price
      t.float :ceiling
      t.float :competitor
      t.float :bb
      t.float :lowest
      t.float :fbalowest
      t.integer :stock
      t.boolean :has_amazon
      t.boolean :alert
      t.integer :ranking
      t.boolean :fba

      t.timestamps null: false
    end
  end
end
