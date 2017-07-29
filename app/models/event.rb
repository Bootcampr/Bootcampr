require 'date_time_attribute'

class Event < ApplicationRecord
    include DateTimeAttribute
    attr_accessor :due_at
    date_time_attribute :due_at

    validates_presence_of :title, :date, :time, :location, :summary, :owner_id

    belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
    has_many :events_projects
    has_many :projects, through: :events_projects

    def format_time
      self.time.strftime('%I:%M %p')
    end

    def format_date
      self.date.strftime('%m/%d/%Y')
    end

    def month
      self.format_date[0] + self.format_date[1]
    end
end
