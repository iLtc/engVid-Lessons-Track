json.extract! config, :id, :name, :title, :value, :created_at, :updated_at
json.url config_url(config, format: :json)