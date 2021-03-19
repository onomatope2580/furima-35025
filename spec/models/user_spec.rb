require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての項目が存在し、かつ入力条件を満たしているとき登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = " "
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = " "
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = "1234a"
      @user.password_confirmation = "1234a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordに全角文字が混ざっていたら登録できないこと' do
      @user.password = "12345あ"
      @user.password_confirmation = "12345あ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordが半角英字のみなら登録できないこと' do
      @user.password = "abcdef"
      @user.password_confirmation = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordが半角数字のみなら登録できないこと' do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = " "
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_nameに半角文字が混ざっていたら登録できないこと' do
      @user.last_name = "田村a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = " "
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameに半角文字が混ざっていたら登録できないこと' do
      @user.first_name = "一生a"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'last_name_kが空では登録できないこと' do
      @user.last_name_k = " "
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name k can't be blank")
    end

    it 'last_name_kにカタカナ以外の文字が混ざっていたら登録できないこと' do
      @user.last_name_k = "タムら"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name k is invalid")
    end

    it 'first_name_kが空では登録できないこと' do
      @user.first_name_k = " "
      @user.valid?
      expect(@user.errors.full_messages).to include("First name k can't be blank")
    end

    it 'first_name_kにカタカナ以外の文字が混ざっていたら登録できないこと' do
      @user.first_name_k = "イッセい"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name k is invalid")
    end

    it 'birthが空では登録できないこと' do
      @user.birth = " "
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end

  end
end
