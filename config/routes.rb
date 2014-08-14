PocketSOHO::Application.routes.draw do

  devise_for :users
  root 'welcome#index'

  # resources :sessions, only: [:create, :destroy]
  get '/settings', to: 'users#settings', as: :user_settings
  # get '/log_in', to: 'sessions#new'
  # get '/log_out', to: 'sessions#log_out', as: :delete_session
  get '/appointments/calendar', to: 'appointments#calendar'

  resources :businesses, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :appointments
  resources :invoices


  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :conversations, only: [:index, :new, :create, :show, :destroy]
  end

  post '/conversations/results', to: 'conversations#results', as: :inbox_results

  get '/oauth2authorize', to: 'google_calendars#oauth2authorize'
  get '/oauth2callback', to: 'google_calendars#oauth2callback'
  get '/calendar_final', to: 'google_calendars#final'

end
