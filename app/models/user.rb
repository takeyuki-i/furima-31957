class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname , presence: true
  validates :email , presence: true
  validates :password , presence: true , format: { with: /\A[a-zA-Z0-9]+\z{6,}/ }
  validates :encrypted_password , presence: true , format: { with: /\A[a-zA-Z0-9]+\z{6,}/ }
  validates :first_name , presence: true , format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
  validates :last_name , presence: true , format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
  validates :first_name_kana , presence: true , format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana , presence: true , format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday , presence: true


end
