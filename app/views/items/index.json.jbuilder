json.array!(@items) do |item|
  json.extract! item, :id, :pc_id, :item_master_id
  json.url item_url(item, format: :json)
end
