class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.text :summary, null: false
      t.text :stack
      t.integer :owner_id, null: false
      t.string :repository

      t.timestamps
    end
  end
end
