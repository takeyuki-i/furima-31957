class ProductBuy
  include ActiveModel::Model
  attr_accessor :zip_code,:state_id,:city,:addres1,:addres2,:tell_num

  with_options presence: true do
    validates :zip_code , format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Zip code can't be blank" }
    validates :city
    validates :addres1
    validates :tell_num , format: { with: /\A[0-9]\z/, message: "Phone number Input only number" }
  end
  validates :state_id , numericality: { other_than: 0, message: "Prefecture Select" }


  def save
    # 各テーブルにデータを保存する処理を書く
    Information.create(zip_code: zip_code,state_id: state_id,city: city,addres1:addres1,addres2:addres2,tell_num:tell_num)

  end
end