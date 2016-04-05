class ArtistsController < ApplicationController
  skip_before_action :ensure_current_artist

  def index
    unless current_artist
      redirect_to login_path
    else
      render :index
    end
  end

  def new
    @artist = Artist.new
  end

  def create
    artist = Artist.new(artist_params)
    if artist.save
      session[:artist_id] = artist.id
      flash[:notice] = "Thanks for registering"
      redirect_to edit_artist_path(artist)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
  end

  private

  def artist_params
    params.require(:artist).permit(:email, :password, :password_confirmation)
  end

end