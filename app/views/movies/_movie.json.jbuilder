json.extract! movie, :id, :title, :summary, :year, :genre, :imdb_link, :created_at, :updated_at
json.url movie_url(movie, format: :json)
