class Dvd <ApplicationRecord
  belongs_to :user
  belongs_to :upc

  validates :user, presence: true
  validates :title, presence: true
  validates :user_rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5, message: "must be between 1 - 5"}, allow_nil: true
  validates :mpaa_rating, inclusion: { in: ["G (General Audience)", "G", "PG (Parental Guidance Suggested)", "PG", "PG-13 (Parental Guidance Suggested)", "PG-13", "R (Restricted)", "R", "NC-17", "X", "NR (Not Rated)", "NR", "Unrated (Not Rated)"], message: "%{value} is not a valid rating" }, allow_nil: true
end
