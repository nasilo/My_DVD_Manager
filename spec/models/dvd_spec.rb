require 'rails_helper'

describe Dvd, type: :model do
  it {should have_valid(:upc).when('012345678901')}
  it {should_not have_valid(:upc).when('0123456789', nil, '')}

  it { should have_valid(:title).when('Silent Movie') }
  it { should_not have_valid(:title).when(nil,'') }

  it { should have_valid(:mpaa_rating).when('G','PG','PG-13','R','NC-17','X', 'NR') }
  it { should_not have_valid(:mpaa_rating).when(0, 13, 17) }

  it { should have_valid(:user_rating).when(1,2,3,4,5) }
  it { should_not have_valid(:user_rating).when( 0, 10, -5, "five") }
end
