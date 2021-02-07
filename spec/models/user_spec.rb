require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき'do
      it 'nickname,email,password,名前,カナ,生年月日があれば登録出来る' do
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき'do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに一意性がないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'testexample'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが半角英数字混合でないと登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは、確認用を含めて２回入力しないと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordと確認用が一致しないと登録できない" do
        @user.password_confirmation = "test123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end

#   describe 'ユーザー新規登録' do
#     context '新規登録がうまくいくとき' do
#       it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
#         expect(@user).to be_valid
#       end
#       it "nicknameが6文字以下で登録できる" do
#         @user.nickname = "aaaaaa"
#         expect(@user).to be_valid
#       end
#       it "passwordが6文字以上であれば登録できる" do
#         @user.password = "000000"
#         @user.password_confirmation = "000000"
#         expect(@user).to be_valid
#       end
#     end

#     context '新規登録がうまくいかないとき' do
#
#       it "passwordが存在してもpassword_confirmationが空では登録できない" do
#         @user.password_confirmation = ""
#         @user.valid?
#         expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
#       end
#     end
#   end
# end



