class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @listings = Listing.all
    @conditions = Condition.all
    @categories = Category.all
  end

  def show
    @offer = Offer.new
    @user = @listing.buyer
  end

  def new
    @listing = Listing.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.buyer = current_user
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
      redirect_to listing_path
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
    params.require(:listing).permit(:title, :description, :price, :expiration, :category_id, :condition_id, :seller_id, :image)
  end
end
