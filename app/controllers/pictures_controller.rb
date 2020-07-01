class PicturesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
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
    if @picture.save
       redirect_to picture_path(@picture), notice: '投稿に成功しました。'
    else
      render :new
    end  
  end  

  def edit
    @picture = Picture.find(params[:id])
    if @picture.user != current_user
      redirect_to pictures_path, alert: '不正なアクセスです。'
    end  
  end
  
  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
       redirect_to picture_path(@picture), notice: '更新に成功しました。'
    else
      render :edit
    end  
  end
  
  def destroy
    picture = Picture.find(params[:id])
    picture.destroy
    redirect_to pictures_path
  end  
  
  private
  
  def picture_params
     params.require(:picture).permit(:title, :body, :image)
  end
  
end
