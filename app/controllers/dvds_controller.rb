class DvdsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @dvds = @user.dvds
  end

  def new
    @dvd = Dvd.new
  end

  def create
    @dvd = Dvd.new(dvd_params)
    @dvd.user = current_user

    if @dvd.mpaa_rating == ""
      @dvd.mpaa_rating = nil
    end

    if @dvd.save
      flash[:notice] = "DVD added!"
      redirect_to dvds_path
    else
      flash[:notice] = @dvd.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def dvd_params
    params.require(:dvd).permit(:upc, :title, :purchase_price, :purchase_location, :user_rating, :mpaa_rating, :synopsis, :studio, :cast, :writer, :producer, :director, :release_date, :run_time)
  end
end
