class Event < ApplicationRecord
    dragonfly_accessor :image

    validates_presence_of :title, :date, :time, :location, :summary, :owner_id
    validate :date_cannot_be_in_the_past

    belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
    has_many :events_projects
    has_many :projects, through: :events_projects
    has_many :attendances
    has_many :attendees, through: :attendances
    acts_as_taggable
    acts_as_taggable_on :categories

    def format_time
      self.time.strftime('%I:%M %p')
    end

    def format_date
      self.date.strftime('%m/%d/%Y')
    end

    def month
      self.format_date[0] + self.format_date[1]
    end

    private
    def date_cannot_be_in_the_past
      if self.date.present? && date < Date.today
        errors.add(:date, "has to be in the future. We're still working on time-traveling.")
      end
    end
end
