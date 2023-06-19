json.extract! group, :id, :name, :description, :user_id, :created_at, :updated_at
if @movies
  json.movies do
    json.array! @movies, partial: 'movies/movie', as: :movie
  end
end
json.url group_url(group, format: :json)
