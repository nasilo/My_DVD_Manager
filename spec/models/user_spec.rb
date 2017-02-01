require 'rails_helper'

describe User, type: :model do
  it {should have_valid(:name).when('User', 'User1', 'user_2', 'user-three')}
  it {should_not have_valid(:name).when('failing name', nil, '', 'nope!')}

  it { should have_valid(:email).when('example@test.com') }
  it { should_not have_valid(:email).when(nil, '') }
end
