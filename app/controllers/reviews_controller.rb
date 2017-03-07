class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_user
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.seller = @user

    if @review.save
      redirect_to @user
    else
      render :new
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
    params.require(:review).permit(:title, :description)
  end
end
