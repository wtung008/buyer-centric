# Preview all emails at http://localhost:3000/rails/mailers/accept_mailer
class AcceptMailerPreview < ActionMailer::Preview
  def accept_mail_preview
    AcceptMailer.accept_email(Listing.last)
  end
end
