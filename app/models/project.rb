class Project < ApplicationRecord
  dragonfly_accessor :image

  validates :title, :summary, :owner_id, presence: true

  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :events_projects
  has_many :events, through: :events_projects
  has_many :collaborations
  has_many :collaborators, through: :collaborations

  acts_as_taggable
  acts_as_taggable_on :categories

  validates_format_of :repository, with: /\A(http|https):\/\/github.com(([0-9]{1,5})?\/.*)?\z/, message: 'must be blank or a valid github url', allow_blank: true

  def use_img
    if self.image_stored?
      "<%= image_tag self.image.thumb('300x300').url%>"
    else
      '<img src="http://lorempixel.com/400/200/abstract" alt="">'
    end
  end

end
