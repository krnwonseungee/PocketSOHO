PocketSOHO::Application.routes.draw do
  scope module: 'welcome' do
    root 'welcome#index'
    resources :sessions, only: [:new, :create, :destroy]
    get '/user/home', to: 'users#home', as: 'user homepage'
  end

  resources :businesses, only: [:create, :show, :edit, :update, :destroy]
  resources :users, only: [:create, :show, :edit, :update, :destroy] do
    resources :messages, only: [:index, :new, :create, :show, :destroy]
  end

end
