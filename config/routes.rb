PocketSOHO::Application.routes.draw do
  root 'welcome#index'

  resources :sessions, only: [:new, :create, :destroy]
  get '/settings', to: 'users#settings', as: :user_settings

  resources :businesses, only: [:new, :create, :show, :edit, :update, :destroy]

  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :conversations, only: [:index, :new, :create, :show, :destroy]
  end

  post '/conversations/results', to: 'conversations#results', as: :inbox_results

end
