class Project < ApplicationRecord
  dragonfly_accessor :image
  
  validates :title, :summary, :owner_id, :repository, presence: true

  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :events_projects
  has_many :events, through: :events_projects

  acts_as_taggable
  acts_as_taggable_on :categories

  validates_format_of :repository, :with => /^(http|https):\/\/github.com(([0-9]{1,5})?\/.*)?$/, :multiline => true
end
