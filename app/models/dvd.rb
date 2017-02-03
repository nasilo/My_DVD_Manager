class Dvd <ApplicationRecord
  belongs_to :user
  belongs_to :upc

  validates :user, presence: true
  validates :title, presence: true
  validates :user_rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5, message: "must be between 1 - 5"}, allow_nil: true
  # validates :mpaa_rating, inclusion: { in: %w(G PG PG-13 R NC-17 X NR), message: "%{value} is not a valid rating" }, allow_nil: true
end
