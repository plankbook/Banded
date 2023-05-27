class ArtistsController < ApplicationController
  def index
    @artists = User.all
    if params[:query].present?
      @artists = @artists.where(location: params[:query])
    end
  end

  def show
    @artist = User.find(params[:id])
    @my_instruments = UserInstrument.where(user_id: params[:id])
  end
end
