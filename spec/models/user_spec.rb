require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録ができる場合' do
      it '情報が正しく入力されていれば新規登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワードが６文字以上半角英数字であれば登録できる' do
        @user.password = 'test123'
        @user.password_confirmation = 'test123'
        expect(@user).to be_valid
      end
      it '名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が出来れば登録できる' do
        @user.last_name = '山田'
        expect(@user).to be_valid
      end
      it '名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が出来れば登録できる' do
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end
      it '名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が出来れば登録できる' do
        @user.last_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
      it '名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が出来れば登録できる' do
        @user.first_name_kana = 'タロウ'
        expect(@user).to be_valid
      end

      context '新規登録がうまくできない場合' do
        it 'ニックネームが空だと登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'emailに@が含まれていない場合登録できない' do
          @user.email = 'hugagmail.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'メールアドレスがすでに登録しているユーザーと重複していると保存できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'パスワードが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'パスワード（確認含む）が5文字以下だと保存できない' do
          @user.password = 'ab123'
          @user.password_confirmation = 'ab123'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
      end
    end
  end
end
