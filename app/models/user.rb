class User < ApplicationRecord
  dragonfly_accessor :image

  has_many :projects, foreign_key: 'owner_id'
  has_many :attendances, as: :attendee
  has_many :events, foreign_key: 'owner_id'
  has_many :events_to_attend, through: :attendances, class_name: 'Event'
  has_many :collaborations, as: :collaborator
  has_many :collab_projects, through: :collaborations, class_name: 'Project'

  acts_as_taggable
  acts_as_taggable_on :interests

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:github]

  # :nocov:
   def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid.to_s).first_or_create do |user|
       user.provider = auth.provider
       user.uid = auth.uid
       user.email = auth.info.email
       user.password = Devise.friendly_token[0,20]
       user.image_url = auth.info.image
       user.save
     end
   end
   # :nocov:
   def full_name
     "#{first_name} #{last_name}"
   end
end
