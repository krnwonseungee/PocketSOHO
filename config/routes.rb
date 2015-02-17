PocketSOHO::Application.routes.draw do

  # devise_scope :user do
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

#   resource :user, only: [:edit] do
#   collection do
#     patch 'update_password'
#   end
# end

  root 'welcome#index'

  get 'search_businesses', to: 'welcome#search_businesses'

  # resources :sessions, only: [:create, :destroy]
  get '/settings', to: 'users#settings', as: :user_settings
  get '/change_password', to: 'users#change_password', as: :change_password
  patch '/update_password', to: 'users#update_password', as: :update_password
  get '/about', to: 'welcome#about'
  get 'add_customer', to: 'welcome#add_customer'
  post 'create_customer', to: 'welcome#create_customer'
  # get '/log_in', to: 'sessions#new'
  # get '/log_out', to: 'sessions#log_out', as: :delete_session
  get '/appointments/calendar', to: 'appointments#calendar'

  resources :businesses, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :appointments
  resources :invoices
  get 'get_invoices', to: 'invoices#get_invoices'


  resources :users, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :conversations, only: [:index, :new, :create, :show, :destroy]
  end

  post '/conversations/results', to: 'conversations#results', as: :inbox_results

  get '/oauth2authorize', to: 'google_calendars#oauth2authorize'
  get '/oauth2callback', to: 'google_calendars#oauth2callback'
  get '/calendar_final', to: 'google_calendars#final'

  # StripeJS
  resources :charges

end
