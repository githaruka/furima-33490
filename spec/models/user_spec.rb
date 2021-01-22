require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    describe "ユーザー新規登録/ユーザー情報" do
      context '新規登録できるとき' do
        it "全ての項目の入力が存在すれば登録できること" do
          expect(@user).to be_valid
        end

        it "passwordが６文字以上であれば登録できる" do
          @user.password = "ab1234"
          @user.password_confirmation ="ab1234"
          expect(@user).to be_valid
        end
      end
    
      context '新規登録できないとき' do
        it "nicknameが空では登録できない" do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
    
        it "emailが空では登録できない" do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "emailに@が含まれていなければ登録できないこと" do
          @user.email = 'sample.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end

        it "重複したemailが存在すれば登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it "passwordが空では登録できない" do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it "passwordは半角英数字が含まれていなければ登録できない" do
          @user.password = "123456"
          @user.password_confirmation ="123456"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it "passwordは英語のみでは登録できない" do
          @user.password = "abcdef"
          @user.password_confirmation = "abcdef"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it "passwordは全角では登録できない" do
          @user.password = "abc１２３"
          @user.password_confirmation = "abc１２３"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it "passwordが5文字以下であれば登録できない" do
          @user.password = "ab123"
          @user.password_confirmation ="ab123"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it "passwordとpassword_confirmationが不一致では登録できないこと" do
          @user.password = "ab1234"
          @user.password_confirmation ="ab12345"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end
    end

    describe "ユーザー新規登録/本人確認" do
      before do
        @user = FactoryBot.build(:user)
      end
      it "last_kanaが全角カタカナでなければ登録できない" do
        @user.last_kana = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana is invalid")
      end
  
      it "first_kanaが全角カタカナでなければ登録できない" do
        @user.first_kana = "ｱｲｳｴｵ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana is invalid")
      end

      it "last_nameが空では登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "first_nameが空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "last_kanaが空では登録できない" do
        @user.last_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
    
      it "first_kanaが空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      
      it "birthdayが空では登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank") 
      end
    end
  end
end
