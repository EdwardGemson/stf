class SessionsController < ApplicationController
  skip_before_action :ensure_current_artist

  def new
  end

  def create
    if request.env["omniauth.auth"]
      artist = Artist.from_omniauth(env["omniauth.auth"])
      session[:artist_id] = artist.id
      redirect_to root_url
    else
      artist = Artist.find_by(email: params[:email])
      if
        artist && artist.authenticate(params[:password])
        session[:artist_id] = artist.id
        flash.notice = "Welcome back to STFU #{artist.name}"
        redirect_to root_path
      else
        flash[:error] = 'Login failed'
        render :new
      end
    end
  end

  def destroy
    session[:artist_id] = nil
    redirect_to root_url
  end
end