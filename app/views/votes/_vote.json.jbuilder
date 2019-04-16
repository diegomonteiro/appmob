json.extract! vote, :id, :created_at, :updated_at, :user_id, :liked
json.url vote_url(vote, format: :json)
