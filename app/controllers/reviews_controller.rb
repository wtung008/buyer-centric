class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_user
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.buyer = current_user
    @review.seller = @user
    @listings = Listing.where(buyer_id: @user.id, seller_id: current_user.id).length
    @reviews = Review.where(seller_id: @user.id, buyer_id: current_user.id).length
    @listings1 = Listing.where(seller_id: @user.id, buyer_id: current_user.id).length
    if @listings > @reviews || @listings1 > @reviews
      if @review.save
        redirect_to @user
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @review.destroy
      redirect_to @user
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end
end
