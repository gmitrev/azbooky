json.array!(@authors) do |author|
  json.extract! author, :id, :name, :nationality, :born, :died
  json.url author_url(author, format: :json)
end
