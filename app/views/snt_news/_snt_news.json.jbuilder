json.extract! snt_news, :id, :name, :description, :snt_id, :user_id, :created_at, :updated_at
json.url snt_news_url(snt_news, format: :json)
