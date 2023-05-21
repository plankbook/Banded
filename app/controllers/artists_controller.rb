class ArtistsController < ApplicationController
  def index
    @artists = User.all
  end

  def show
    @artist = User.find(params[:id])
  end
end
