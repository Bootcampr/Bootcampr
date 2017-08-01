FactoryGirl.define do
  factory :event do
    title "MyString"
    date Date.today
    time Time.now
    location "MyString"
    summary "MyText"
    owner_id 1
  end
end
