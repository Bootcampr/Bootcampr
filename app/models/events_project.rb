class EventsProject < ApplicationRecord
  belongs_to :event
  belongs_to :project
end
