if event.anonymous == false && !event.user_id.blank?
	json.extract! event, :id, :description, :lat, :lon, :city_id, :event_type, :event_files, :user_id, :event_status, :created_at, :updated_at, :votes, :anonymous
else
	json.extract! event, :id, :description, :lat, :lon, :city_id, :event_type, :event_files, :event_status, :created_at, :updated_at, :votes, :anonymous
end
json.url event_url(event, format: :json)
