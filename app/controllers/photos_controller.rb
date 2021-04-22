class PhotosController < ApplicationController
  def index
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :image, :area_id).merge(user_id: current_user.id)
  end
end
