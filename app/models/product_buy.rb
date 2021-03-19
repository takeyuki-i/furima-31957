class ProductBuy
  include ActiveModel::Model
  attr_accessor :zip_code, :delivery_area_id, :city, :addres1, :addres2, :tell_num, :user_id, :item_id, :token, :price

  with_options presence: true do
    validates :price
    validates :token
    validates :zip_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
    validates :addres1
    validates :tell_num, format: { with: /\A[0-9]+\z/ }, length: { maximum: 11 }
    validates :user_id
    validates :item_id
  end
  validates :delivery_area_id, numericality: { other_than: 1 }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Information.create(zip_code: zip_code, delivery_area_id: delivery_area_id, city: city, addres1: addres1, addres2: addres2,
                       tell_num: tell_num, order_id: order.id)
  end
end
