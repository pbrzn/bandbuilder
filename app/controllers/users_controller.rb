class UsersController < ApplicationController
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

  private

  def user_params
    params.require(:user).permit(:name, :email, :type, :password)
  end
end
