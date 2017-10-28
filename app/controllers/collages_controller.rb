class CollagesController < ApplicationController
  def index
    @collages = Collage.where("Name like ? and TagList like ?", "%#{params[:search]}%", "%#{params[:tag]}%").paginate(page: params[:page], per_page: 30)
  end

  def show
    @collage = Collage.find(params[:id])
  end
end
