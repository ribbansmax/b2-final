class Doctor < ApplicationRecord
  has_many :operations
  has_many :surgeries, through: :operations
  belongs_to :hospital
end