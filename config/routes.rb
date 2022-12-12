Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#top'
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :levels, only: %i[index show] do
    member do
      resources :records, only: %i[index show create update], sharrow: true
    end
    scope module: :levels do
      get 'introduction', to: 'level1#introduction'
      get 'step1', to: 'level1#step1'
    end
  end
end
