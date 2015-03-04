json.array!(@books) do |book|
  json.extract! book, :id, :title, :description, :isbn, :lang, :page_count, :published_in, :published_by
  json.url book_url(book, format: :json)
end
