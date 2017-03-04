class OffersController < ApplicationController
  def create
    @offer = Offer.new(offer_params)

    if @offer.save
      redirect_to @offer.listing
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:listing_id, :seller_id)
  end
end
