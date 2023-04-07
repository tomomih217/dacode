Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#top'
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create edit update]
  resources :levels, only: %i[index show] do
    member do
      resources :records, only: %i[create update]
    end
    get 'introduction', to: 'steps#introduction', as: 'introduction'
    resources :steps, only: %i[show] do
      get 'quizzes/:quiz_id/new', to: 'answers#new', as: 'new_answer'
      get 'quizzes/:quiz_id/edit', to: 'answers#edit', as: 'edit_answer'
      post 'quizzes/:quiz_id', to: 'answers#create', as: 'answers'
      patch 'quizzes/:quiz_id', to: 'answers#update', as: 'answer'
    end
  end
  resources :scores, only: %i[show]
  get '/ranking', to: 'scores#index'
  get '/myscore', to: 'scores#myscore'
  resources :kusocodes, only: %i[index new create destroy] do
    resources :flowers, only: %i[create destroy], shallow: true
  end
end
