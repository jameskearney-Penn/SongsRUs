Rails.application.routes.draw do
  resources :tegistrations
  resources :playlists
  resources :users
  root 'pages#home'
  get '/artists', to: 'artists#index'
  get '/artists/:id', to: 'artists#show', as: 'artist_show'
  get '/song/:id/:artist_id', to: 'songs#show', as: 'song_show'
  get '/playlist/index', to: 'playlists#index'
  get '/search', to: 'artists#search'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy' 
  post '/login', to: 'sessions#create'
  get 'registration/add_playlist/:user_id/:playlist_id', to: 'registrations#add_playlist', as: 'add_playlist'
  get 'registration/drop_playlist/:user_id/:playlist_id', to:'registrations#drop_playlist', as: 'drop_playlist'
  get 'tegistration/add_song/:song_id/:playlist_id', to: 'tegistrations#add_song', as: 'add_song'
  get 'tegistration/drop_playlist/:song_id/:playlist_id', to:'tegistrations#delete_song', as: 'drop_song'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
