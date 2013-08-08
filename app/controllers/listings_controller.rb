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
  end

  private

  def listings
    Listing.all
  end

end
