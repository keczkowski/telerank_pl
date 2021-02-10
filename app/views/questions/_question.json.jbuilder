json.extract! question, :id, :screenplay_id, :name, :body, :sequence, :created_at, :updated_at
json.url question_url(question, format: :json)
