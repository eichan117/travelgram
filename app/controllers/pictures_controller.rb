class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    @picture.save
    redirect_to picture_path(@picture)
  end  

  def edit
    @picture = Picture.find(params[:id])
  end
  
  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to picture_path(@picture)
  end
  
  private
  
  def picture_params
     params.require(:picture).permit(:title, :body, :image)
  end
  
end
