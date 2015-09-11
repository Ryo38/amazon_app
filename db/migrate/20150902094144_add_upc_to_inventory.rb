class AddUpcToInventory < ActiveRecord::Migration
  def change
    add_column :inventories, :upc, :string
  end
end
