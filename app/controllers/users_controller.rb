class UsersController < ApplicationController
  def home
    @businesses = Business.all #change to find_by_user_id
    @customers = User::Customer.all #change to find_by_business_id
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
