json.extract! event, :id, :description, :lat, :lon, :city_id, :event_type, :event_files, :user_id, :event_status, :created_at, :updated_at
json.url event_url(event, format: :json)
