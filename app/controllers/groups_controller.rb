class GroupsController < ApplicationController
  def index
    sort = params[:sort] || 'Name asc'
    @groups = TorrentGroup.where("Name like ?", "%#{params[:search]}%").order(sort).paginate(page: params[:page], per_page: 30)
  end

  def show
    @group = TorrentGroup.find(params[:id])
    sort = params[:sort] || 'Media asc'
    @torrents = @group.torrents.order(sort).paginate(page: params[:page])
  end
end
