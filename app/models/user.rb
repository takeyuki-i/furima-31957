class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :nickname
  validates :password , format: { with: /[a-zA-Z]{1,}+[0-9]{1,}/ }
  validates :first_name , format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
  validates :last_name , format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
  validates :first_name_kana , format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana , format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday
  end

end