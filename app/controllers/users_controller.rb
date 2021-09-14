class UsersController < ApplicationController

  def index
  end

  def new
    if logged_in?
      flash[:message] = "You are already signed up!"
      if current_user.type == "MusicDirector"
        redirect_to music_director_path(current_user)
      elsif current_user.type == "Musician"
        redirect_to musician_path(current_user)
      end
    else
      @user = User.new
    end
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    if @user.errors.any?
      @errors = @user.errors
      render :new
    elsif @user.type == "MusicDirector"
      flash[:message] = "Welcome #{@user.name}!"
      redirect_to music_director_path(@user)
    elsif @user.type == "Musician"
      flash[:message] = "Welcome #{@user.name}!"
      redirect_to musician_path(@user)
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if logged_in? && @user == current_user
      @user.update(user_params)
      if @user.errors.any?
        @errors = @user.errors
        render :edit
      elsif @user.type == "MusicDirector"
        redirect_to music_director_path(@user)
      elsif @user.type == "Musician"
        redirect_to musician_path(@user)
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :bio, :type, :password, :instrument_id, :pay_rate, instrument: [:name])
  end
end
