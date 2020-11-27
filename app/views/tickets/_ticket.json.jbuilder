json.extract! ticket, :id, :event_id, :first_name, :last_name, :age, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
