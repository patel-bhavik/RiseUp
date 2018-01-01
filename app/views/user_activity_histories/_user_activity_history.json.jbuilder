json.extract! user_activity_history, :id, :points_earned, :created_at, :updated_at
json.url user_activity_history_url(user_activity_history, format: :json)
