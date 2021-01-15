class Surgery < ApplicationRecord
  has_many :operations
  has_many :doctors, through: :operations

  enum week_day: %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
end