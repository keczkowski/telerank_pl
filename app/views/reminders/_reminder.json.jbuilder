json.extract! reminder, :id, :remind_at, :name, :user_id, :client_id, :body, :created_at, :updated_at
json.url reminder_url(reminder, format: :json)
