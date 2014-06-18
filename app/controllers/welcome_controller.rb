class WelcomeController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find(session[:user_id])
      @businesses = Business.all #change to find_by_user_id
      render "home"
    else
      render "info"
    end
  end

  def settings
    @user = User.find(session[:user_id])
    @businesses = Business.all #change to find_by_user_id
  end
end
