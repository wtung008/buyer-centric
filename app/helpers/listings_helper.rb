module ListingsHelper
  def buyer_full_name
    @listing.buyer.first_name + ' ' + @listing.buyer.last_name
  end
  def seller_full_name
    @listing.seller.first_name + ' ' + @listing.seller.last_name
  end
end
