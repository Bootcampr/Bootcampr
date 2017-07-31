FactoryGirl.define do
  factory :attendance do
    event factory: :event
    attendee factory: :user
  end
end
