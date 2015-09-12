json.array!(@star_items) do |star_item|
  json.extract! star_item, :id
  json.url star_item_url(star_item, format: :json)
end
