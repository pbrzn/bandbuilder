class SessionsController < ApplicationController
  def new
    if logged_in? && current_user.type == "MusicDirector"
      flash[:message] = "You are already logged in!"
      redirect_to music_director_path(current_user)
    elsif logged_in? && current_user.type == "Musician"
      flash[:message] = "You are already logged in!"
      redirect_to musician_path(current_user)
    end
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
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
