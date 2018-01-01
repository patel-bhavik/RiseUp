json.extract! event, :id, :name, :desc, :points_needed, :event_img, :created_at, :updated_at
json.url event_url(event, format: :json)
