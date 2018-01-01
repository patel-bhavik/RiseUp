json.extract! task, :id, :type, :points_per_mile, :created_at, :updated_at
json.url task_url(task, format: :json)
