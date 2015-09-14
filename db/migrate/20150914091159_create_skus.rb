class CreateSkus < ActiveRecord::Migration
  def change
    create_table :skus do |t|
      t.references :user, index: true, foreign_key: true
      t.string :sku
      t.float :my_price
      t.float :ceiling_price
      t.float :floor_price
      t.string :supplier
      t.float :cost
      t.boolean :repricing_status
      t.boolean :fba_status

      t.timestamps null: false
    end
  end
end
