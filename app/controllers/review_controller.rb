class ReviewController < ApplicationController
   before_action :set_listing
   before_action :set_review, only [:show, :edit, :update, :destroy]


  def new
    @review = Review.new
  end

  def edit
  end




  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.listing_id = @listing_id

  if @review.save
    redirect_to @listing
  else
    render @review.error
  end
end

  def update
    if @review.update(review_params)
      redirect_to @review
    else
      render @review.error
  end

  def destroy
    @review.destroy
    redirect_to root_path
  end
  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end
  def review_params
    params.require(:review).permit(:rating, :comment)

  end
end
