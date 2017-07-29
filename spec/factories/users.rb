FactoryGirl.define do
  factory :user do

    first_name 'Barak'
    last_name 'Obama'
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    bootcamp 'Dev Bootcamp'
    summary { Faker::Lorem.paragraph }

  end
end
