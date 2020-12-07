json.extract! event, :id, :name, :location_id, :event_type, :date, :description, :start, :end, :num_tickets, :price, :created_at, :updated_at
json.url event_url(event, format: :json)
