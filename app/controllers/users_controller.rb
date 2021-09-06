class UsersController < ApplicationController
  helper_method :logged_in?
  helper_method :current_user

  def index
    @music_directors = MusicDirector.all
    @musicians = Musician.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    if @user.errors.any?
      redirect_to new_user_path
    elsif @user.type == "MusicDirector"
      redirect_to music_director_path(@user)
    elsif @user.type == "Musician"
      redirect_to musician_path(@user)
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if logged_in? && @user == current_user
    @user.update!(user_params)
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
    params.require(:user).permit(:name, :email, :type, :password)
  end

  def logged_in?
    true if session[:user_id]
  end

  def current_user
    session[:user_id]
  end
end
