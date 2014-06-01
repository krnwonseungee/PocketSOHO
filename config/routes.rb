PocketSOHO::Application.routes.draw do
  scope module: 'welcome' do
    root 'welcome#index'
    resources :sessions, only: [:new, :create, :destroy]
    get '/dashboard', to: 'welcome#dashboard', as: 'dashboard'
  end

  resources :messages, only: [:index, :new, :create, :show, :destroy]
  resources :businesses
  resources :biz_owners
  resources :customers

end
