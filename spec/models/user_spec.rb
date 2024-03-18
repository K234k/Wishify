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
    end
  end
end
