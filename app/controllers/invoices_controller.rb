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

  def get_invoices
    invoices = Invoice.all
    @invoice_data = [];
    invoices.each do |i|
      invoices_hash = i.attributes
      invoices_hash['due_month'] = i.attributes['due_date'].month
      @invoice_data.push(invoices_hash)
    end
    respond_to do |format|
      format.json { render json: @invoice_data }
    end
  end
end
