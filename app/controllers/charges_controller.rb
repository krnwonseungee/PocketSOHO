class ChargesController < ApplicationController
  include ActionView::Helpers::NumberHelper
  skip_before_filter :verify_authenticity_token
  before_filter :set_user

  def new
  end

  def create
    # Amount in cents"
  @amount = number_with_precision((Invoice.find(session[:invoice_id]).amount * 100), precision: 0, delimter: ',')
    Invoice.find(session[:invoice_id]).update(paid: true)
    customer = Stripe::Customer.create(
      :email => @user.email,
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:'alert-info'] = e.message
    redirect_to charges_path
  end
end
