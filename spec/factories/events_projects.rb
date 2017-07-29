FactoryGirl.define do
  factory :events_projects do
    event factory: :event
    project factory: :project
  end
end
