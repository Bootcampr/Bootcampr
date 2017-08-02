namespace :email do
  desc "Send weekly email digest to subscribed users"
  task :send_digest => :environment do
    users = User.all.select { |user| user.subscribed == true }
    if Date.today.wday == 1
      users.each { |user| DigestMailer.digest_email(user).deliver}
    end
  end

end
