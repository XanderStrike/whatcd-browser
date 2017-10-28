class CollagesController < ApplicationController
  def index
    if params[:search].present?
      @collages = Collage.where("Name like ?", "%#{params[:search]}%").paginate(page: params[:page], per_page: 30)
    else
      @collages = Collage.paginate(page: params[:page], per_page: 50)
    end
  end

  def show
    @collage = Collage.find(params[:id])
  end
end
