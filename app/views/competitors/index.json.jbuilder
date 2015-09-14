json.array!(@competitors) do |competitor|
  json.extract! competitor, :id, :asin_id, :condition, :lowest_price, :buybox_price, :lowest_fba_price, :has_amazon, :number_of_offers
  json.url competitor_url(competitor, format: :json)
end
