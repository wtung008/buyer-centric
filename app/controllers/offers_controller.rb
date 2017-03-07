class OffersController < ApplicationController
  def create
    @offer = Offer.new()
    @offer.seller = current_user
    @offer.listing = Listing.find(params[:listing_id])

    if @offer.save
      redirect_to @offer.listing
    end
  end
end
