class OfferMailer < ApplicationMailer
  default from: ENV["OUTLOOK_USERNAME"]

  def offer_email(user)
    @user = user
    mail(to: @user.listing.buyer.email, subject: 'Offer Email')
  end
end
