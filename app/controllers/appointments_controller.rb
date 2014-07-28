class AppointmentsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
      if @user.type == "BusinessOwner"
          @appointments = Appointment.where( "business_owner_id = ?", @user.id )
      else
          @appointments = Appointment.where( "customer_id = ?", @user.id )
      end
      @appointment_dates = @appointments.pluck( :date )

  end

  def new
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
  end

  def edit
    @user = User.find(session[:user_id])
    @business = Business.find(params[:id])
  end

  def show
    @user = User.find(session[:user_id])
    @business = Business.find(params[:id])
    @biz_owner = User.find(@business.business_owner_id)
  end

  def update
    @user = User.find(session[:user_id])

  end

  def destroy
    @user = User.find(session[:user_id])
  end
end
