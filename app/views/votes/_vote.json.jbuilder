json.extract! vote, :id, :created_at, :updated_at, :user_id, :liked, :event_id
json.url vote_url(vote, format: :json)
