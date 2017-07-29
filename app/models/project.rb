class Project < ApplicationRecord
  validates :title, :summary, :owner_id, presence: true

  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :events_projects
  has_many :events, through: :events_projects
end
