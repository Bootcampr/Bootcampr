class AddSubscribedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :subscribed, :boolean, null: false, default: true
  end
end
