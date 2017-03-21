json.array!(@tobuys) do |tobuy|
  json.extract! tobuy, :id, :name, :desctiption, :quantity
  json.url tobuy_url(tobuy, format: :json)
end
