PocketSOHO::Application.routes.draw do
  root 'welcome#index'

  resources :sessions, only: [:new, :create, :destroy]
  get '/settings', to: 'users#settings', as: :user_settings
  get '/appointments/calendar', to: 'appointments#calendar'

  resources :businesses, only: [:new, :create, :show, :edit, :update, :destroy]

  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :conversations, only: [:index, :new, :create, :show, :destroy]
    resources :appointments
  end

  post '/conversations/results', to: 'conversations#results', as: :inbox_results

  get '/oauth2authorize', to: 'google_calendars#oauth2authorize'
  get '/oauth2callback', to: 'google_calendars#oauth2callback'
  get '/calendar_final', to: 'google_calendars#final'

end
