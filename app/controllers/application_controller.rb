class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?
  helper_method :current_user
  helper_method :is_logged_in
  helper_method :is_signed_up

  def logged_in?
    session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end

  def redirects_to_user(message)
    flash[:message] = message
    if current_user.type == "MusicDirector"
      redirect_to music_director_path(current_user)
    elsif current_user.type == "Musician"
      redirect_to musician_path(current_user)
    end
  end



end
