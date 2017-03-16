class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @listings = Listing.where(nil)
    filtering_params(params).each do |key, value|
      @listings = @listings.public_send(key, value) if value.present?
    end
    @conditions = Condition.all
    @categories = Category.all
    if params[:search]
      @listings = Listing.search(params[:search]).order("created_at DESC")
    end
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
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    if @listing.update(listing_params)
      if @listing.seller_id_changed?
        AcceptMailer.accept_email(@listing).deliver
      end
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

  def filtering_params(params)
    params.slice(:category, :condition)
  end
end
