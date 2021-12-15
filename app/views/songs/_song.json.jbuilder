json.extract! song, :id, :artist_id, :title, :album, :created_at, :updated_at
json.url song_url(song, format: :json)
