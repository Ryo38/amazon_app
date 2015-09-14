json.array!(@asins) do |asin|
  json.extract! asin, :id, :sku_id, :asin, :title, :category, :ranking, :brand, :img_url
  json.url asin_url(asin, format: :json)
end
