class Api::V1::DvdsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @dvd = Dvd.new(dvd_params)
    @dvd.user = current_user
    add_images(@dvd)
    if @dvd.mpaa_rating == ""
      @dvd.mpaa_rating = nil
    end

    if @dvd.save
      flash[:notice] = "DVD added!"
      redirect_to dvds_path
    else
      flash[:notice] = @dvd.errors.full_messages.to_sentence
      @upc = @dvd.upc

      render json: {dvd: @dvd, upc: @upc}
    end
  end

  def upc
    if !Upc.where(upc: upc_params[:upc]).empty?
      @upc = Upc.where(upc: upc_params[:upc]).first
    else
      @upc = Upc.create(upc_params)
    end
    @dvd = Dvd.new
    @dvd.upc = @upc
    populate_form(@dvd)

    render json: {dvd: @dvd, upc: @upc}
  end

  private

  def dvd_params
    params.require(:dvd).permit(:upc_id, :title, :purchase_price, :purchase_location, :user_rating, :mpaa_rating, :synopsis, :studio, :cast, :writer, :producer, :director, :release_date, :run_time)
  end

  def upc_params
    params.require(:upc).permit(:upc)
  end

  def can_change?(dvd)
    current_user == dvd.user
  end

  def populate_form(dvd_object)
    data = AmazonHelper.new(dvd_object.upc.upc)
    dvd_object.title = data.title
    dvd_object.mpaa_rating = data.mpaa
    dvd_object.synopsis = data.synopsis
    dvd_object.studio = data.studio
    dvd_object.cast = data.cast
    dvd_object.writer = data.writer
    dvd_object.producer = data.producer
    dvd_object.director = data.director
    dvd_object.release_date = data.release_date
    dvd_object.run_time = data.run_time
    dvd_object
  end

  def add_images(dvd_object)
    data = AmazonHelper.new(dvd_object.upc.upc)
    dvd_object.image_small = data.small_image
    dvd_object.image_large = data.large_image
    dvd_object
  end

end
