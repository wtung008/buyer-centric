# Preview all emails at http://localhost:3000/rails/mailers/offer_mailer
class OfferMailerPreview < ActionMailer::Preview
  def offer_mail_preview
    OfferMailer.offer_email(Offer.last)
  end
end
