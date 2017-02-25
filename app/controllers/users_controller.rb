class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.email = session[:auth]["info"]["email"]
    @user.oauth_uid = session[:auth]["uid"]
    if @user.save
      session[:auth].clear
      session[:user_id] = @user.id
      flash[:success] = "Registered successfully."
      redirect_to user_dvds_path(@user)
    else
      flash[:alert] = "There was a problem registering."
      render :new
    end
  end

  def new
    @user = User.new(oauth_uid: session[:auth]["uid"])
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:warning] = "You are not authorized to view this record."
      redirect_to user_dvds_path(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
