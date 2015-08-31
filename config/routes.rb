Rails.application.routes.draw do

  root 'posts#index'
  resources :users

  resources :posts do
    resources :comments, except: [:index]
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  get '/logout' => 'sessions#destroy'
  post '/post/:id/up_vote' => 'posts#up_vote', as: :up_vote

end
