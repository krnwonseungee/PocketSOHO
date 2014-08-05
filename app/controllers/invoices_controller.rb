class InvoicesController < ApplicationController

  def index
    @user = User.find(session[:user_id])
      if @user.type == "BusinessOwner"
        ##FIX
          @invoices = Invoice.where( "business_id = ?", @user.businesses.first.id )
      else
          @invoices = Invoice.where( "customer_id = ?", @user.id )
      end
      @invoice_dates = @invoices.pluck( :due_date )
  end

  def create
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.find(session[:user_id])
  end

  def show
    @user = User.find(session[:user_id])
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
  end

  def destroy
    @user = User.find(session[:user_id])
  end
end
