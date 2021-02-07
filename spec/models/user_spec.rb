require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

describe 'ユーザー新規登録' do
    it 'nickname,email,password,名前,カナ,生年月日があれば登録出来る' do
      expect(@user).to be_valid
    end
  end
end
