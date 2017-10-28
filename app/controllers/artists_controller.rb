class ArtistsController < ApplicationController
  def index
    if params[:search].present?
      @artists = ArtistGroup.where("Name like ?", "%#{params[:search]}%").paginate(page: params[:page], per_page: 30)
    else
      @artists = ArtistGroup.paginate(page: params[:page], per_page: 50)
    end
  end

  def show
    @artist = ArtistGroup.find(params[:id])
    @torrent_groups = @artist.torrent_groups.paginate(page: params[:page], per_page: 50)
  end
end
