class OffersController < ApplicationController
  def create
    @offer = Offer.new(offer_params)
    @offer.seller = current_user
    @offer.listing = Listing.find(params[:listing_id])

    if @offer.save
      OfferMailer.offer_email(@offer).deliver
      redirect_to @offer.listing
    end
  end
  private
  def offer_params
    params.require(:offer).permit(:buyer_id)
  end
end
