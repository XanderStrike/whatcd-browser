class ArtistsController < ApplicationController
  def index
    sort = params[:sort] || 'Name asc'
    @artists = ArtistGroup.where("Name like ?", "%#{params[:search]}%").order(sort).paginate(page: params[:page], per_page: 30)
  end

  def show
    @artist = ArtistGroup.find(params[:id])
    sort = params[:sort] || 'Name asc'
    @torrent_groups = @artist.torrent_groups(sort)
  end

  def random
    redirect_to action: :show, id: ArtistGroup.random.ArtistID
  end
end
