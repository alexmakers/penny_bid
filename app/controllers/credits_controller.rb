class CreditsController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = params[:amount].to_i

    raise "Unexpected price" unless [500, 2500].include? @amount

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => '100 credits',
      :currency    => 'gbp'
    )

    flash[:alert] = "Payment processed!"
    redirect_to '/'

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
