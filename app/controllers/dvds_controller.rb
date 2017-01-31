class DvdsController < ApplicationController
  def index
    @dvds = Dvd.all
  end
end
