class UserHouseholdMember < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :household_member_name, presence: true
end
