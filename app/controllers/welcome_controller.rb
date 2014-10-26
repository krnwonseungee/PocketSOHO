class WelcomeController < ApplicationController
  before_action :set_user, only: [:settings]

  def index
    if user_signed_in?
      @user = current_user
      if current_user.first_name == nil && current_user.last_name == nil
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
        ##CHANGE. ONLY DISPLAYING FIRST 3 NOW
        @appointments = Appointment.where( "business_owner_id = ?", @user.id ).take(3)


      else
        @businesses = Business.where( "id = ?", @user.business_id ) # change for multiple businesses
        Conversation.where("customer_id = ? AND seen_by_customer = ?", @user.id, false ).each do |thread|
          @unread_conversations << thread.messages.last
        end
        ##CHANGE. ONLY DISPLAYING FIRST 3 NOW
        @appointments = Appointment.where( "customer_id = ?", @user.id ).take(3)
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
end
