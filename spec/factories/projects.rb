FactoryGirl.define do
  factory :project do
    title "MyString"
    summary "MyText"
    stack "MyText"
    repository "https://github.com"
    owner factory: :user
  end
end
