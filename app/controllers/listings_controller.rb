class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @listings = Listing.all
  end

  def show
    @offer = Offer.new
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @listing.destroy
      redirect_to root_path
    end
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :price, :expiration, :category_id, :condition_id, :user_id, :image)
  end
end
