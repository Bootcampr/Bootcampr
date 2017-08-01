class DigestMailer < ApplicationMailer
  default from: 'bootcamprapp@gmail.com'

  def digest_email(user)
    @user = user
    mail(to: @user.email, subject: 'What\'s happening this week on Bootcampr')
end
