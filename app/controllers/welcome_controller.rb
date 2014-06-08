class WelcomeController < ApplicationController
  def index
    @user = User::BusinessOwner.find(session[:user_id]) || User::Customer.find(session[:user_id])
  end
end
