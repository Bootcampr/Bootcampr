class DigestMailer < ApplicationMailer
  default from: 'bootcamprapp@gmail.com'

  def digest_email(user)
    @user = user
    attachments.inline["twitter_icon.png"] = File.read("#{Rails.root}/app/assets/images/twitter_icon.png")
    mail(to: @user.email, subject: 'What\'s happening this week on Bootcampr')
  end
end
