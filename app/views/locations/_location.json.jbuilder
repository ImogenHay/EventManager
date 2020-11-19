json.extract! location, :id, :name, :description, :country, :street, :postcode, :created_at, :updated_at
json.url location_url(location, format: :json)
