class Event < ApplicationRecord

    validates_presence_of :title, :date, :time, :location, :summary

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
