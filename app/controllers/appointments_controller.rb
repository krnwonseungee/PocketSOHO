class AppointmentsController < ApplicationController
  before_filter :set_user

  def index
      if @user.type == "BusinessOwner"
          @appointments = Appointment.where( "business_owner_id = ?", @user.id )
      else
          @appointments = Appointment.where( "customer_id = ?", @user.id )
      end
      @appointment_dates = @appointments.pluck( :time ).sort
  end

  def new
    @appointment = Appointment.new
    @appt_person_list = {}
    @business_id = @user.business_id
      recipient_first_names = Customer.where( "business_id =?", @business_id ).pluck(:first_name)
      recipient_last_names = Customer.where( "business_id =?", @business_id ).pluck(:last_name)
      recipient_first_names.each_with_index do |val, i|
        full_name = recipient_first_names[i] + " " + recipient_last_names[i]
        @appt_person_list[ full_name ] = Customer.where( "business_id =?", @business_id )[i]
      end
  end

  def create
      customer_name = params[:appointment][:customer_id].split(" ")
      @appt_person = Customer.find_by_first_name_and_last_name(customer_name[0], customer_name[1])
      @appointment = Appointment.create(
      customer_id: @appt_person.id,
      business_owner_id: @user.id,
      business_id: params["appointment"]["business_id"].to_i,
      notes: params["appointment"]["notes"],
      date: Date.new(Date.today.year, params["monthList"].to_i, params["dateList"].to_i),
      time: DateTime.new(Date.today.year, params["monthList"].to_i, params["dateList"].to_i, params["hourList"].to_i, params["minutesList"].to_i)
      )
    redirect_to appointments_path
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @appt_person = Customer.find( @appointment.customer_id )
  end

  def show
    @appointment = Appointment.find( params[:id])
    @business = Business.find(@appointment.business_id)
    if @user.type == "BusinessOwner"
      @appt_person = Customer.find( @appointment.customer_id )
      @conversation = Conversation.find_by_customer_id_and_business_owner_id( @appt_person, @user.id )
      @upcoming_appts = Appointment.where( "customer_id = ? AND date > ?", @appointment.customer_id,  Date.today )
      @img_url = @appt_person.image_url
    else
      @appt_person = BusinessOwner.find( @appointment.business_owner_id )
      @conversation = Conversation.find_by_customer_id_and_business_owner_id( @user.id, @appt_person)
      @upcoming_appts = Appointment.where( "business_owner_id = ? AND date > ?", @appointment.business_owner_id,  Date.today )
      @img_url = @business.image_url
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)
    @appointment.update(date: @appointment.time.to_date )
    redirect_to appointments_path
  end

  def destroy
  end

  def calendar
    @appointments_by_date = Appointment.all.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

private

  def set_user
    @user = current_user
  end

  def appointment_params
    params.require(:appointment).permit(:customer_id, :business_owner_id, :business_id, :notes, :time)
  end
end
