class InvoicesController < ApplicationController
  before_filter :set_user

  def index
      if @user.type == "BusinessOwner"
        ##FIX
          @invoices = Invoice.where( "business_id = ?", @user.businesses.first.id )
      else
          @invoices = Invoice.where( "customer_id = ?", @user.id )
      end
      @invoice_dates = @invoices.pluck( :due_date )
  end

  def create
  end

  def new
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @user = current_user
  end
end
