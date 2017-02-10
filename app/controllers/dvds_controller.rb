class DvdsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    if params[:search]
      @query = params[:search]
      @dvds = @user.dvds.search(@query).order("created_at DESC")
    else
      @dvds = @user.dvds
    end
  end

  def show
    @dvd = Dvd.find(params[:id])
  end

  def new
    @dvd = Dvd.new
    @upc = Upc.new
    @submit_text = "Add DVD"
  end

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
      newupc = Upc.new
      newupc.upc = @upc.upc
      @upc = newupc

      render :new
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
    newupc = Upc.new
    newupc.upc = @upc.upc
    @upc = newupc
    @submit_text = "Add DVD"

    render :new
  end

  def edit
    @title = Dvd.find(params[:id]).title
    @dvd = Dvd.find(params[:id])
    @submit_text = "Save"

    unless can_change?(@dvd)
      raise ActionController::RoutingError.new("Not Found")
    end

    @delete = true
    @user_can_change = false
    unless current_user.nil?
      @user_can_change = can_change?(@dvd)
    end
  end

  def update
    @dvd = Dvd.find(params[:id])

    unless can_change?(@dvd)
      raise ActionController::RoutingError.new("Not Found")
    end

    if @dvd.update(dvd_params)
      flash[:notice] = "Edits Saved"
      redirect_to @dvd
    else
      @delete = true
      @title = Dvd.find(params[:id]).title
      flash[:notice] = @dvd.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @dvd = Dvd.find(params[:id])
    @dvd.destroy
    redirect_to dvds_path
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
    if data.error
      flash[:notice] = data.error_message
    else
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
    end
    dvd_object
  end

  def add_images(dvd_object)
    data = AmazonHelper.new(dvd_object.upc.upc)
    dvd_object.image_small = data.small_image
    dvd_object.image_large = data.large_image
    dvd_object
  end
end
