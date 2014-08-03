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
    @appointment = Appointment.new
  end

  def create
    @user = User.find(session[:user_id])
    @appointment = Appointment.create(
      customer_id: params["appointment"]["customer_id"].to_i,
      business_owner_id: params["appointment"]["business_owner_id"].to_i,
      business_id: params["appointment"]["business_id"].to_i,
      notes: params["appointment"]["notes"]
    )
    redirect_to appointments_path
  end

  def edit
    @user = User.find(session[:user_id])
    @business = Business.find(params[:id])
  end

  def show
    @user = User.find(session[:user_id])
    @appointment = Appointment.find( params[:id])
    @business = Business.find(@appointment.business_id)
    if @user.type == "BusinessOwner"
      @appt_person = Customer.find( @appointment.customer_id )
      @upcoming_appts = Appointment.where( "customer_id = ? AND date > ?", @appointment.customer_id,  Date.today )
      @img_url = @appt_person.image_url
    else
      @appt_person = BusinessOwner.find( @appointment.business_owner_id )
      @upcoming_appts = Appointment.where( "business_owner_id = ? AND date > ?", @appointment.business_owner_id,  Date.today )
      @img_url = @business.image_url
    end
  end

  def update
    @user = User.find(session[:user_id])

  end

  def destroy
    @user = User.find(session[:user_id])
  end

  def calendar
    @user = User.find(session[:user_id])
    @appointments_by_date = Appointment.all.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end

private

private

  def appointment_params
    params.require(:appointment).permit(:customer_id, :business_owner_id, :business_id, :notes, :date, :time)
  end
