class Event < ApplicationRecord

    validates_presence_of :title, :date, :time, :location, :summary

end
