namespace :email do
  desc "Send weekly email digest to subscribed users"
  task :send_digest => :environment do
    users = User.all.select { |user| user.subscribed == true }
    users.each { |user| DigestMailer.digest_email(user).deliver; p user.email }
  end

end
