require 'rails_helper'

RSpec.describe User, type: :model do
  

  before do
    @user = FactoryBot.build(:user)
  end

  describe "新規登録：ユーザー情報：本人情報確認" do
  
      context '保存できる場合' do
        
              it "name,nickname,email、password,password_confirmationが存在すれば登録できる" do
                  expect(@user).to be_valid
              end
      end




   end
end
