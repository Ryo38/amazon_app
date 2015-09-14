class CreateAsins < ActiveRecord::Migration
  def change
    create_table :asins do |t|
      t.references :sku, index: true, foreign_key: true
      t.string :asin
      t.string :title
      t.string :category
      t.integer :ranking
      t.string :brand
      t.string :img_url

      t.timestamps null: false
    end
  end
end
