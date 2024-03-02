require 'rails_helper'

RSpec.describe User, type: :model do
  # 有効なユーザーのテスト
  it "is valid with a name, email, and password" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  # 名前がない場合は無効なユーザーのテスト
  it "is invalid without a name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  # メールアドレスがない場合は無効なユーザーのテスト
  it "is invalid without an email" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  # パスワードがない場合は無効なユーザーのテスト
  it "is invalid without a password" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  # 重複したメールアドレスの場合は無効なユーザーのテスト
  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "test@example.com")
    user = FactoryBot.build(:user, email: "test@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  # パスワードが6文字未満の場合は無効なユーザーのテスト
  it "is invalid with a password less than 6 characters" do
    user = FactoryBot.build(:user, password: "short", password_confirmation: "short")
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end
end
