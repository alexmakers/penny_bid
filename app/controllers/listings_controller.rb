class ListingsController < ApplicationController

  helper_method :listings
  before_filter :authenticate_admin!, except: [ :index, :bid ]

  def index
  end

  def new
  end

  def create
    @listing = Listing.new params[:listing].permit(:title, :description)

    if @listing.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def bid
    @listing = Listing.find(params[:id])
    @listing.bid!
    websocket[:bids].trigger 'new',
      { id: @listing.id, 
        price: view_context.price_pounds(@listing.current_price_pennies) }
  end

  private

  def listings
    Listing.order(:id).all
  end

end
