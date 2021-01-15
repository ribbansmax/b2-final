class Surgery < ApplicationRecord
  has_many :operations
  has_many :doctors, through: :operations

  enum week_day: %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]

  def same_day_surgeries
    Surgery.where(week_day: self.week_day).where.not(id: self.id)
  end

  def self.by_operating_room
    rooms = pluck(:operating_room).uniq
    hash = {}
    rooms.each do |room|
      hash[room] = where(operating_room: room).pluck(:title)
    end
    hash
  end
end