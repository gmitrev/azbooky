json.array!(@shelves) do |shelf|
  json.extract! shelf, :id, :name, :user_id, :system
  json.url shelf_url(shelf, format: :json)
end
