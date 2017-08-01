class RenameColumnsOnUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :github, :github_handle
    rename_column :users, :twitter, :twitter_handle
    rename_column :users, :linkedin, :linkedin_handle
  end
end
