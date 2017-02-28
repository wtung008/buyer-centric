class ReviewController < ApplicationController
  def create
    @review = Review.new(review_params)

  if @review.save
    redirect_to listings_url
  else
    render 'listings/new'
  end
end
  private
  def review_params
    params.require(:review).permit(:description, :listing_id, :user_id)

  end
end
