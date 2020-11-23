json.extract! event, :id, :name, :location_id, :type, :date, :description, :start, :end, :tickets, :price, :created_at, :updated_at
json.url event_url(event, format: :json)
