class ArtistsController < ApplicationController
  def index
    # @artists = User.all
    if params[:query].present?
      # @artists = @artists.where(location: params[:query])
      @artists = User.search_by_location_and_user_instrument(params[:query])
      # raise
    else
      @artists = User.all
    end
  end

  def show
    @artist = User.find(params[:id])
    @my_instruments = UserInstrument.where(user_id: params[:id])
  end
end
