class MessagesController < ApplicationController

  def index
    @user = BusinessOwner.find(session[:user_id]) || Customer.find(session[:user_id])
  end

  def new

  end

  def create

  end

  def destroy

  end
end
