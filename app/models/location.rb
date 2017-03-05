class Location < ApplicationRecord
  belongs_to :user
  has_many :dvds

  validates :user, presence: true
  validates :name, presence: true
  validates :online, inclusion: { in: [true, false] }
  validates :online, exclusion: { in: [nil] }
  validates :physical_location, inclusion: { in: [true, false] }
  validates :physical_location, exclusion: { in: [nil] }
end
