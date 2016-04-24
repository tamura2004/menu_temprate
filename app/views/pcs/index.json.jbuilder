json.array!(@pcs) do |pc|
  json.extract! pc, :id, :name, :gp
  json.url pc_url(pc, format: :json)
end
