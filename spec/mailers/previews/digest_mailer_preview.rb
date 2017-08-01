# Preview all emails at http://localhost:3000/rails/mailers/digest_mailer
class DigestMailerPreview < ActionMailer::Preview
  def digest_email_preview
    DigestMailer.digest_email(User.first)
  end
end
