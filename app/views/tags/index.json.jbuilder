json.array!(@tags) do |tag|
  json.extract! tag, :id, :name, :label, :description
  json.url tag_url(tag, format: :json)
end
