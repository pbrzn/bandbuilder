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
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if @user.type == "MusicDirector"
        redirect_to music_director_path(@user)
      elsif @user.type == "Musician"
        redirect_to musician_path(@user)
      end
    elsif params[:email].empty? || params[:password].empty?
      flash[:message] = "Both email and password fields cannot be empty. Please try again."
      render :new
    else
      flash[:message] = "Email or password is incorrect. Please try again."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
