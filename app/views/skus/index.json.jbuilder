json.array!(@skus) do |sku|
  json.extract! sku, :id, :user_id, :sku, :my_price, :ceiling_price, :floor_price, :supplier, :cost, :repricing_status, :fba_status
  json.url sku_url(sku, format: :json)
end
