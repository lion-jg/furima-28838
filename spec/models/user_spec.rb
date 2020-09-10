require 'rails_helper'
RSpec.describe User, type: :model do
end
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、family_nameとfirst_name、family_name_furiganaとfirst_name_furigana、birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上、かつ半角英数字混合であれば登録できる' do
        @user.password = '111qqq'
        @user.password_confirmation = '111qqq'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailが存在しても「@」を含んでいなければ登録できない' do
        @user.email = '000.sample.com'
        @user.valid?
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在しても半角英数字混合でない場合登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'family_nameが存在しても半角では登録できない' do
        @user.family_name = 'ｻｶｼﾀ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name Full-width characters')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが存在しても半角では登録できない' do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end
      it 'family_name_furiganaが空では登録できない' do
        @user.family_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name furigana can't be blank")
      end
      it 'family_name_furiganaが存在しても全角カタカナ以外では登録できない' do
        @user.family_name_furigana = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name furigana Full-width katakana characters')
      end
      it 'first_name_furiganaが空では登録できない' do
        @user.first_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana can't be blank")
      end
      it 'first_name_furiganaが存在しても全角カタカナ以外では登録できない' do
        @user.first_name_furigana = 'ﾉﾘｺ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name furigana Full-width katakana characters')
      end
      it 'birthが空では登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end
