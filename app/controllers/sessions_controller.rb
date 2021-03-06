class SessionsController < ApplicationController

  def new
    redirects_to_user("You are already logged in!") if logged_in?
  end

  def create
    if auth
      @user = User.find_or_create_by(uid: auth[:uid]) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = SecureRandom.hex(15)
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
      if !@user || !@user.authenticate(params[:password])
        flash[:error_message] = "Login information was incorrect. Please try again."
        render :new
      else
        session[:user_id] = @user.id
        if @user.type == "MusicDirector"
          redirect_to music_director_path(@user)
        elsif @user.type == "Musician"
          redirect_to musician_path(@user)
        end
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
