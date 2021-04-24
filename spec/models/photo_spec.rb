require 'rails_helper'

RSpec.describe Photo, type: :model do
  before do
    @photo = FactoryBot.build(:photo)
  end

  describe "新規投稿：投稿内容確認" do
    
    context'保存できる場合' do

      it "title,image,area_idが存在すれば登録できる" do
      expect(@photo).to be_valid
      end
     end

    context'保存できない場合' do
      it "Titleがないと投稿することができない"do
      @photo.title = ""
      @photo.valid?
      expect(@photo.errors.full_messages).to include("Title can't be blank")
      end

      it "地域の情報がないと投稿することができない"do
      @photo.area_id = ""
      @photo.valid?
      expect(@photo.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end

      it "地域の情報がid1だと投稿することができない"do
      @photo.area_id = "1"
      @photo.valid?
      expect(@photo.errors.full_messages).to include("Area must be other than 1")
      end

    end

    end
end

