require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザ登録ができる時' do
      it 'すべての項目が入力されていれば登録できること。' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザ登録ができない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが一意性であること。' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'test.test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが英語のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが半角英数字混合での入力が必須であること' do
        @user.password = 'a1a1a1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordは全角では登録できない' do
        @user.password = 'ａ１ａ１ａ１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'パスワードとパスワード（確認）は、値の一致が必須であること。' do
        @user.password = '123456'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'お名前(全角)は、名字と名前がそれぞれ必須であること。' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'お名前(全角)は、名字と名前がそれぞれ必須であること。' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること。' do
        @user.last_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana can't be blank")
      end

      it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること。' do
        @user.first_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana can't be blank")
      end

      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。' do
        @user.last_name_furigana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name furigana is invalid')
      end

      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。' do
        @user.first_name_furigana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name furigana is invalid')
      end

      it '名字(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it '名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it '生年月日が必須であること。' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end 
    end
  end
end
