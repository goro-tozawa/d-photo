class PhotosController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]

  def index
    @photos = Photo.includes(:user).order("created_at DESC")
    # @photo = Photo.newは必要？

  end

  def new
   @photo = Photo.new
  end

  def show
   @photo = Photo.find(params[:id])
   @link = link.new
  end
  
  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id

    if @photo.save
      # redirect_back(fallback_location: root_path)
      redirect_to root_path
    else

      # redirect_back(fallback_location: root_path)
      render :new
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :image, :area_id).merge(user_id: current_user.id)
  end
end
