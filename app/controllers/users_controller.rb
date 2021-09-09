class UsersController < ApplicationController

  def index
  end

  def new
    if logged_in? && current_user.type == "MusicDirector"
      flash[:message] = "You are already signed up!"
      redirect_to music_director_path(current_user)
    elsif logged_in? && current_user.type == "Musician"
      flash[:message] = "You are already signed up!"
      redirect_to musician_path(current_user)
    end
  end

  def create
    @user = User.create(user_params)
    if @user.errors.any?
      @errors = @user.errors
      render :new
    elsif @user.type == "MusicDirector"
      "Welcome #{@user.name}!"
      redirect_to music_director_path(@user)
    elsif @user.type == "Musician"
      "Welcome #{@user.name}!"
      redirect_to musician_path(@user)
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if logged_in? && @user == current_user
      @user.update(user_params)
    end
    if @user.errors.any?
      redirect_to edit_user_path
    elsif @user.type == "MusicDirector"
      redirect_to music_director_path(@user)
    elsif @user.type == "Musician"
      redirect_to musician_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :type, :password, :type, :instrument_id, :pay_rate)
  end
end
