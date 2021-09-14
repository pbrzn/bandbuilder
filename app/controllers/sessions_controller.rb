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
    if auth
      @user = User.find_or_create_by(uid: auth[:uid]) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = rand(36**8).to_s(36)
      end
      session[:user_id] = @user.id
      if @user.type == "MusicDirector"
        redirect_to music_director_path(@user)
      elsif @user.type == "Musician"
        redirect_to musician_path(@user)
      else
        redirect_to user_path(@user)
      end
    else
      @user = User.find_by(email: params[:email])
      return head(:forbidden) unless @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if @user.type == "MusicDirector"
        redirect_to music_director_path(@user)
      elsif @user.type == "Musician"
        redirect_to musician_path(@user)
      end
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
