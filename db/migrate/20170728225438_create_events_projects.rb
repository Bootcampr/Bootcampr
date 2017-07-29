class CreateEventsProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :events_projects do |t|
      t.integer :event_id
      t.integer :project_id

      t.timestamps
    end
  end
end
