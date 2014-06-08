class UsersController < ApplicationController
  def home
    @user = User::BusinessOwner.find(session[:user_id]) || User::Customer.find(session[:user_id])
    @businesses = Business.all #change to find_by_user_id
    if @user.type == "Business Owner"
      @customers = @user.businesses.users.find_by_type("Customer") #verify this is correct
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
