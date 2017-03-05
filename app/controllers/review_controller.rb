class ReviewController < ApplicationController
   before_action :set_review, only [:show, :edit, :update, :destroy]

   def show
   end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.listing_id = @listing.id

    if @review.save
      redirect_to @listing
    else
      render 'listings/show'
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review
    else
      render 'listings/show'
  end

  def destroy
    @review.destroy
    redirect_to root_path
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :description, :user_id, :listing_id)

  end
end
