class Hospital < ApplicationRecord
  has_many :doctors
  has_many :surgeries, -> {distinct}, through: :doctors
end