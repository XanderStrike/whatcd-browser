class CollagesController < ApplicationController
  def index
    sort = params[:sort] || 'Name desc'
    @collages = Collage.where("Name like ? and TagList like ?", "%#{params[:search]}%", "%#{params[:tag]}%").order(sort).paginate(page: params[:page], per_page: 30)
  end

  def show
    @collage = Collage.find(params[:id])
    sort = params[:sort] || 'a.Name asc'
    @torrents = @collage.torrents(sort)
  end
end
