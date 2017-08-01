class Collaboration < ApplicationRecord
  belongs_to :collaborator, class_name: 'User', foreign_key: 'collaborator_id'
  belongs_to :project
end
