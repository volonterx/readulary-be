json.array! @books do |book|
  json.extract! book, :id, :name, :created_at, :updated_at
  json.file do
    json.url rails_blob_path(book.file, disposition: "attachment")
    json.filename book.file.filename
  end
  json.cover do
    json.url rails_representation_url(book.cover.variant(resize_to_limit: [200, 150]), disposition: "attachment")
  end
end