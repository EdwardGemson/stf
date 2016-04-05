class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_artist

  before_action :ensure_current_artist, only: [:new, :create, :update, :destroy]

   def current_artist
    artist = Artist.find_by(id: session[:artist_id]) if session[:artist_id]
  end

  def ensure_current_artist
    redirect_to new_session_path unless current_artist
  end

  def log_in(artist)
    session[:artist_id] = artist.id
  end

  def log_out
    session.delete(:artist_id)
    @current_artist = nil
  end

  def logged_in?
    !current_artist.nil?
  end
end
