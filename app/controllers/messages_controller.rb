class MessagesController < ApplicationController

  def index
    @user = User::BusinessOwner.find(session[:user_id]) || User::Customer.find(session[:user_id])
  end

  def new

  end

  def create

  end

  def destroy

  end
end
