require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
        it "項目が全て入力されていると登録できる" do
          expect(@user).to be_valid
        end
        it "passwordが6文字以上の英数字で登録できる" do
          @user.password = "tanaka1234"
          @user.password_confirmation = "tanaka1234"
          expect(@user).to be_valid
        end
        it "family_name_kanjiが漢字であれば登録できる" do
          @user.family_name_kanji = "山田"
          expect(@user).to be_valid
        end
        it "first_name_kanjiが漢字であれば登録できる" do
          @user.family_name_kanji = "花子"
          expect(@user).to be_valid
        end
        it "family_name_katakanaがカタカナであれば登録できる" do
          @user.family_name_katakana = "ヤマダ"
          expect(@user).to be_valid
        end
        it "family_name_katakanaがカタカナであれば登録できる" do
          @user.family_name_katakana = "ハナコ"
          expect(@user).to be_valid
        end
    end
  end

    context '新規登録がうまくいかないとき' do
        it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "passwordが入力されていてもpassword_confirmationが空だと登録できない" do
        @user.password = "yamada1234"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "passwordが5文字以下だと登録できない" do
        @user.password = "tana1"
        @user.password_confirmation = "tana1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it "passwordが数字を含まなければ登録できない" do
        @user.password = "tanakada"
        @user.password_confirmation = "tanakada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it "passwordが英語を含まなければ登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it "family_name_kanjiが空だと登録できない" do
        @user.family_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji can't be blank")
        end
        it "family_name_kanjiが漢字でなければ登録できない" do
        @user.family_name_kanji = "たなか"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji is invalid")
        end
        it "first_name_kanjiが空だと登録できない" do
        @user.first_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
        end
        it "first_name_kanjiが漢字でなければ登録できない" do
        @user.family_name_kanji = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji is invalid")
        end
        it "family_name_katakanaが空だと登録できない" do
        @user.family_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name katakana can't be blank")
        end
        it "family_name_katakanaがカタカナでなければ登録できない" do
        @user.family_name_katakana = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name katakana is invalid")
        end
        it "first_name_katakanaが空だと登録できない" do
        @user.first_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
        end
        it "first_name_katakanaがカタカナでなければ登録できない" do
        @user.family_name_katakana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name katakana is invalid")
        end
        it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
    end
end
