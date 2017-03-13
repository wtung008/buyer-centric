class AcceptMailer < ApplicationMailer
  default from: ENV["OUTLOOK_USERNAME"]

  def accept_email(user)
    @user = user
    mail(to: @user.seller.email, subject: 'Accept Email')
  end
end
