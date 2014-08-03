class AppointmentsController < ApplicationController

  def index
      if @user.type == "BusinessOwner"
          @appointments = Appointment.where( "business_owner_id = ?", @user.id )
      else
          @appointments = Appointment.where( "customer_id = ?", @user.id )
      end
      @appointment_dates = @appointments.pluck( :date )

  end

  def new
  end

  def create

  end

  def edit
    @business = Business.find(params[:id])
  end

  def show
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

  end

  def destroy
  end

  def calendar
    @appointments_by_date = Appointment.all.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
