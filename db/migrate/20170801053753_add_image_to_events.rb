class AddImageToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :image_uid, :string
    add_column :events, :image_name, :string
  end
end
