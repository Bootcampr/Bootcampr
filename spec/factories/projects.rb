FactoryGirl.define do
  factory :project do
    title "MyString"
    summary "MyText"
    stack "MyText"
    owner factory: :user
  end
end
