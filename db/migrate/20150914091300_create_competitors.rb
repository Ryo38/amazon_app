class CreateCompetitors < ActiveRecord::Migration
  def change
    create_table :competitors do |t|
      t.references :asin, index: true, foreign_key: true
      t.string :condition
      t.float :lowest_price
      t.float :buybox_price
      t.float :lowest_fba_price
      t.boolean :has_amazon
      t.integer :number_of_offers

      t.timestamps null: false
    end
  end
end
