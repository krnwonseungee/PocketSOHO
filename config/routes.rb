PocketSOHO::Application.routes.draw do
  root 'welcome#index'

  resources :sessions, only: [:new, :create, :destroy]
  get '/user/home', to: 'users#home', as: :user_homepage

  resources :businesses, only: [:new, :create, :show, :edit, :update, :destroy]

  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :messages, only: [:index, :new, :create, :show, :destroy]
  end

end
