class ListingsController < ApplicationController
  before_action! set_listing
  def index
    @listings = Listing.all
  end

  def show
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:list).permit(:title, :description, :price, :expiration, :category_id, :user_id)
  end
end
