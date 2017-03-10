class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if user_signed_in?
      @listing = Listing.where(buyer_id: @user.id, seller_id: current_user.id).length
      @review = Review.where(seller_id: @user.id, buyer_id: current_user.id).length
      @listing1 = Listing.where(seller_id: @user.id, buyer_id: current_user.id).length
    end

    @reviews = Review.where(seller_id: @user.id).order("created_at DESC")

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end
end
