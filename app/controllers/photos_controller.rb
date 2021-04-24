class PhotosController < ApplicationController
  def index
    @photos = Photo.includes(:user).order("created_at DESC")
  end

  def new
   @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to root_path
      
    else
      render :new
      
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :image, :area_id).merge(user_id: current_user.id)
  end
end
