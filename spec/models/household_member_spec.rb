require 'rails_helper'

describe UserHouseholdMember, type: :model do
  it {should have_valid(:household_member_name).when('Bob', 'Mary-Sue', 'John Doe')}
  it {should_not have_valid(:household_member_name).when(nil, '')}
end
