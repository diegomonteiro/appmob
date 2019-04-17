json.extract! event_response, :id, :created_at, :updated_at
json.url event_response_url(event_response, format: :json)
