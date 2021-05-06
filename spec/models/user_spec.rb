require 'rails_helper'

RSpec.describe User, type: :model do
  

  before do
    @user = FactoryBot.build(:user)
  end

  describe "新規登録：ユーザー情報：本人情報確認" do
  
      context '保存できる場合' do
        
        it "name,nickname,email,password,password_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
        end
      end

      context '保存できない場合' do

        it "nameが空では登録できない"do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include
        ("Name can't be blank")
        end

        it "nicknameが空では登録できない"do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "emailが空では登録できない"do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it"重複したemailは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include ("Email has already been taken")
        end

        it "emailが@がなければ登録できない"do
        @user.email = "testexample"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it "passwordが空では登録できない"do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it "passwordは半角英数混合でなければ登録できない" do
          @user.password = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password both letters and numbers")
        end

        it "passwordが５文字以下であれば登録できないこと" do
          @user.password = "12345"
          @user.password_confirmation = "12345"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it 'passwordは全角では登録できない' do
          @user.password = 'AAAAAA'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password both letters and numbers")
        end

        it "passwordが存在してもpassword_confirmationが空では登録できない"do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "passwordとpassword_confirmationが不一致では登録できないこと" do
          @user.password = "aaa000"
          @user.password_confirmation = "aaa0000"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end



        


      end




   end
end
