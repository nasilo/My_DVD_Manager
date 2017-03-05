require 'rails_helper'

describe Location, type: :model do
  it { should have_valid(:name).when('Bob\'s House of DVDs', 'Beast Buy', 'WallyMart.com') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:online).when(true, false) }
  it { should_not have_valid(:online).when(nil, '') }

  it { should have_valid(:physical_location).when(true, false) }
  it { should_not have_valid(:physical_location).when(nil, '') }
end
