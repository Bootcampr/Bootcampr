FactoryGirl.define do
  factory :collaborator do
    user factory: :user
    project factory: :project
  end
end
