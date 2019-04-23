json.extract! vote, :id, :created_at, :updated_at, :liked, :event_id
json.url vote_url(vote, format: :json)
