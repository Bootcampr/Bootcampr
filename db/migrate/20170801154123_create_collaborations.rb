class CreateCollaborations < ActiveRecord::Migration[5.0]
  def change
    create_table :collaborations do |t|
      t.belongs_to :collaborator, foreign_key: true
      t.belongs_to :project, foreign_key: true

      t.timestamps
    end
  end
end
