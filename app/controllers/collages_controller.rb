class CollagesController < ApplicationController
  def index
    sort = params[:sort] || 'Name asc'
    @collages = Collage.where("Name like ? and TagList like ?", "%#{params[:search]}%", "%#{params[:tag]}%").order(sort).paginate(page: params[:page], per_page: 30)
  end

  def show
    @collage = Collage.find(params[:id])
    sort = params[:sort] || 'a.Name asc'
    @torrents = @collage.torrents(sort)
  end

  def random
    redirect_to action: :show, id: Collage.random.ID
  end
end
