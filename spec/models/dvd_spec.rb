require 'rails_helper'

describe Dvd, type: :model do
  it { should have_valid(:title).when('Silent Movie') }
  it { should_not have_valid(:title).when(nil,'') }

  it { should have_valid(:mpaa_rating).when("G (General Audience)", "G", "PG (Parental Guidance Suggested)", "PG", "PG-13 (Parental Guidance Suggested)", "PG-13", "R (Restricted)", "R", "NC-17", "X", "NR (Not Rated)", "NR", "Unrated (Not Rated)") }
  it { should_not have_valid(:mpaa_rating).when(0, 13, 17) }

  it { should have_valid(:user_rating).when(1,2,3,4,5) }
  it { should_not have_valid(:user_rating).when( 0, 10, -5, "five") }
end
