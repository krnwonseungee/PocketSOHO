class WelcomeController < ApplicationController
  before_action :set_user, only: [:settings, :add_customer]

  def index
    @user = User.new
    if user_signed_in?
      @user = current_user
      if (!current_user.first_name.present?&& !current_user.last_name.present?) || !@user.business_id.present? || !current_user.type.present? || (@user.type == "Customer" && @user.sign_in_count == 1)
        redirect_to edit_user_path(current_user)
        return ""
      end
      @unread_conversations = Array.new
      @invoices = Invoice.where("business_id = ? AND due_date = ?", @user.business_id, Date.new(Date.today.year, Date.today.month, -1))
      @invoice_dates = @invoices.pluck( :due_date )

      if @user.type == "BusinessOwner"
        @businesses = Business.where( "business_owner_id = ?", @user.id )
        Conversation.where("business_owner_id = ? AND seen_by_business_owner = ?", @user.id, false ).each do |thread|
          @unread_conversations << thread.messages.last
        end
        @appointments = Appointment.where( "business_owner_id = ?", @user.id ).limit(3)


      else
        @businesses = Business.where( "id = ?", @user.business_id ) # change for multiple businesses
        Conversation.where("customer_id = ? AND seen_by_customer = ?", @user.id, false ).each do |thread|
          @unread_conversations << thread.messages.last
        end
        @appointments = Appointment.where( "customer_id = ?", @user.id ).limit(3)
      end
      @unread_conversations.sort_by!{ |msg| msg.updated_at }.reverse!
      render "home"
    else
      render "info", layout: false
    end
  end

  def settings
    @businesses = Business.all #change to find_by_user_id
  end

  def search_businesses
    @biz_str_array = []
    biz_string = ""
    Business.all.each do |b|
      @biz_str_array.push("#{b.name} - #{b.id}")
    end
    respond_to do |format|
      format.html
      format.any(:json) { render request.format.to_sym => @biz_str_array }
    end
  end

  def about
    render "about", layout: false
  end

  def add_customer
    @customer = Customer.new
  end

  def create_customer
    puts "******************************"
    puts "CREATING CUSTOMER"
    @generated_password = Devise.friendly_token.first(8)
    @customer = Customer.create(customer_params)
    @customer.update(password: @generated_password, business_id: current_user.business_id)
    @customer.save!
    WelcomeMailer.email_added_customer(@customer, @generated_password).deliver
    redirect_to add_customer_path
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :city, :state, :email, :phone)
  end
end
