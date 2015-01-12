class AppointmentsController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_filter :set_user


  def index
      if @user.type == "BusinessOwner"
          @appointments = Appointment.where( "business_owner_id = ?", @user.id )
      else
          @appointments = Appointment.where( "customer_id = ?", @user.id )
      end
      @new_appts = []
      @appointments.each do |appt|
        appt_hash = appt.attributes
       if @user.type == "BusinessOwner"
        appt_hash['client_name'] = "#{Customer.find( appt.customer_id ).first_name}  #{Customer.find( appt.customer_id ).last_name}"
       else
        appt_hash['client_name'] =  "#{BusinessOwner.find( appt.business_owner_id ).first_name}  #{BusinessOwner.find( appt.business_owner_id ).last_name}"
       end

        appt_hash['biz_name'] = Business.find(appt.business_id).name
        appt_hash['amt'] = number_with_precision(appt.amount, precision: 2, delimter: ',')
        appt_hash['formatted_time'] = appt.time.strftime("%I:%M%p")
        appt_hash['formatted_date'] = appt.time.strftime("%m/%d/%Y")
        appt_hash['readable_date'] = appt.date.strftime("%A, %b %d %y")
        @new_appts.push(appt_hash)
      end
      @appointment_dates = @appointments.pluck( :date ).sort.uniq
      puts "**************************************************************"
      puts @appointment_dates
      @new_appt_dates = @appointment_dates.map do |date|
        date = date.strftime("%A, %b %d %y")
      end

      respond_to do |format|
        format.html
        format.any(:json) { render request.format.to_sym => [@new_appts, @new_appt_dates] }
      end
  end

  def new
    if @user.type == "Customer"
        redirect_to appointments_path
        flash[:error] = 'You must be a Business Owner to access this page.'
    end
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
      business_id: @user.business_id,
      notes: params["appointment"]["notes"],
      date: Date.new(params["yearList"].to_i, params["monthList"].to_i, params["dateList"].to_i),
      time: DateTime.new(Date.today.year, params["monthList"].to_i, params["dateList"].to_i, params["hourList"].to_i, params["minutesList"].to_i),
      amount: params["appointment"]["amount"],
      subject: params["appointment"]["subject"],
      )
    redirect_to appointments_path
  end

  def edit
    if @user.type == "Customer"
        redirect_to appointments_path
        flash[:error] = 'You must be a Business Owner to access this page.'
    end
    @appointment = Appointment.find(params[:id])
    @appt_person = Customer.find( @appointment.customer_id )
  end

  def show
    @appointment = Appointment.find( params[:id])
    if @appointment.business_id !== @user.business_id
      redirect_to root_path
    end
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
    @business = Business.find(@user.business_id)
    if @user.type == "BusinessOwner"
      @appointments_by_date = Appointment.where("business_id=? AND business_owner_id = ?", @business.id, @user.id).group_by(&:date)
    else
      @appointments_by_date = Appointment.where("business_id=? AND customer_id = ?", @business.id, @user.id).group_by(&:date)
    end
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

private
  def appointment_params
    params.require(:appointment).permit(:customer_id, :business_owner_id, :business_id, :notes, :time, :subject)
  end
end
