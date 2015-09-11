json.array!(@inventories) do |inventory|
  json.extract! inventory, :id, :sku, :asin, :title, :condition, :price, :ceiling, :competitor, :bb, :lowest, :fbalowest, :stock, :has_amazon, :alert, :ranking, :fba
  json.url inventory_url(inventory, format: :json)
end
