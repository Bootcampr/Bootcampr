class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
      t.belongs_to :attendee
      t.belongs_to :event

      t.timestamps
    end
  end
end
