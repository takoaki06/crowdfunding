json.extract! product, :id, :title, :desc, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
