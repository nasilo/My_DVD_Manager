class DvdsController < ApplicationController
  before_action :authenticate_user!

  def index
    @dvds = current_user.dvds
  end
end
