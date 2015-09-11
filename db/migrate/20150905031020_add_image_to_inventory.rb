class AddImageToInventory < ActiveRecord::Migration
  def change
    add_column :inventories, :image, :string
  end
end
