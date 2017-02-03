require 'rails_helper'

describe Upc, type: :model do
  it {should have_valid(:upc).when('012345678901')}
  it {should_not have_valid(:upc).when('0123456789', nil, '')}
end
