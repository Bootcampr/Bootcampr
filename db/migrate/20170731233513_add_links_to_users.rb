class AddLinksToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :github, :string
    add_column :users, :linkedin, :string
    add_column :users, :website, :string
  end
end
