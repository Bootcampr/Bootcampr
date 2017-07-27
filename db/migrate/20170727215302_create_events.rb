class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.date :date, null: false
      t.time :time, null: false
      t.string :location, null: false
      t.text :summary, null: false

      t.timestamps
    end
  end
end
