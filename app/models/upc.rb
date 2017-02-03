class Upc < ApplicationRecord
  has_many :dvds
  has_many :users, through: :dvds

  validates :upc, presence: true, uniqueness: true, numericality: true, length: { is: 12 }
end
