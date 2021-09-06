class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if @user.type == "MusicDirector"
        redirect_to music_director_path(@user)
      elsif @user.type == "Musician"
        redirect_to musician_path(@user)
      end
    else
      # @errors = @user.errors.any?
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id].clear
  end
end
