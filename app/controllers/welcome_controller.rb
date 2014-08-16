class WelcomeController < ApplicationController
  before_action :authenticate_user!, only: [:settings]
  before_filter :set_user

  def index
    if user_signed_in?
      @businesses = Business.all #change to find_by_user_id
      @unread_conversations = Array.new

      if @user.type == "BusinessOwner"
        Conversation.where("business_owner_id = ? AND seen_by_business_owner = ?", @user.id, false ).each do |thread|
          @unread_conversations << thread.messages.last
        end
        ##CHANGE. ONLY DISPLAYING FIRST 3 NOW
        @appointments = Appointment.where( "business_owner_id = ?", @user.id ).take(3)

      else
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

private

  def set_user
    @user = current_user
  end
end
