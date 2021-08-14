require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
        it '全て存在すれば登録できること' do
          expect(@user).to be_valid
        end
      end

      context '登録できないとき' do
        it 'nicknameが空では登録できないこと' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できないこと' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it '重複したemailが存在する場合は登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'emailが@を含んでいないと登録できないこと' do
          @user.email = 'abcabc.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end

        it 'passwordが空では登録できないこと' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが半角でないと登録できないこと' do
          @user.password = 'ＡＢｃ１２３'
          @user.password_confirmation = 'ＡＢｃ１２３'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end

        it 'passwordが英字でないと登録できないこと' do
          @user.password = 'abcdef'
          @user.password_confirmation = 'abcdef'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end

        it 'passwordが数字でないと登録できないこと' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end

        it 'passwordが５文字以下であれば登録できないこと' do
          @user.password = '11aaa'
          @user.password_confirmation = '11aaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordとpassword_confirmationが不一致では登録できないこと' do
          @user.password = '11aaaa'
          @user.password_confirmation = '11aaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'first_nameが空では登録できないこと' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it 'last_nameが空では登録できないこと' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できないこと' do
          @user.first_name = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name is invalid')
        end

        it 'last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できないこと' do
          @user.last_name = 'abc'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name is invalid')
        end

        it 'first_name_kanaが空では登録できないこと' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it 'last_name_kanaが空では登録できないこと' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end

        it 'first_name_kanaが全角（カタカナ）でないと登録できないこと' do
          @user.first_name_kana = 'ああああ'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name kana is invalid')
        end

        it 'last_name_kanaが全角（カタカナ）でないと登録できないこと' do
          @user.last_name_kana = 'ああああ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name kana is invalid')
        end

        it 'birthdayが空では登録できないこと' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
  end
end
