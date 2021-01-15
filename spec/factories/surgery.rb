FactoryBot.define do
  factory :surgery do
    title {Faker::TvShows::TwinPeaks.quote}
    week_day {Faker::Number.between(from: 0, to: 6)}
    operating_room {Faker::Number.between(from: 1, to: 100)}
  end
end