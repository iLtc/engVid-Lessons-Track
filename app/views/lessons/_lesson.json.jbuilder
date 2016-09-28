json.extract! lesson, :id, :title, :description, :image, :url, :completed, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)