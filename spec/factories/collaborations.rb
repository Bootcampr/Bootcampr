FactoryGirl.define do
  factory :collaboration do
    collaborator factory: :user
    project factory: :project
  end
end
