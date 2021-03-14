class ProductBuy
  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :zip_code,:delivery_area_id,:city,:addres1,:addres2,:tell_num,:item_id,:user_id

  with_options presence: true do
    validates :number, format: { with: /\A[0-9]+\z/ }
    validates :exp_month, format: { with: /\A[0-9]+\z/ }
    validates :exp_year, format: { with: /\A[0-9]+\z/ }
    validates :cvc, format: { with: /\A[0-9]+\z/ }
    validates :zip_code , format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city  , format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
    validates :addres1
    validates :tell_num , format: { with: /\A[0-9]+\z/ },length: { maximum: 11}
  end
  validates :delivery_area_id , numericality: { other_than: 1 }

  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(item_id: item_id,user_id: user_id)
    Information.create(zip_code: zip_code,delivery_area_id: delivery_area_id,city: city,addres1: addres1,addres2: addres2,tell_num: tell_num,order_id: order.id)
  end
end
