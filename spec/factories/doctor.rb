FactoryBot.define do
  factory :doctor do
    name {Faker::Movies::Departed.actor}
    specialty {Faker::Hipster.sentence}
    university {Faker::Educator.university}
  end
end