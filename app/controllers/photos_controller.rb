class PhotosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create]

  def index
    @photos = Photo.includes(:user).order("created_at DESC")
  end

  def new
   @photo = Photo.new
  end

  def show
   @photo = Photo.find(params[:id])
  #  @link = link.new
  end
  
  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id

    respond_to do |format|
      if @photo.save
        format.html { redirect_to root_path, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @photo }
      
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
    
      end
    end
  end

  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :image, :area_id, :description).merge(user_id: current_user.id)
  end
end
