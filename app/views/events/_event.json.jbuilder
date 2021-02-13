json.extract! event, :id, :user_id, :client_id, :call_id, :agreement_id, :reminder_id, :name, :body, :created_at, :updated_at
json.url event_url(event, format: :json)
