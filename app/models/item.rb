class Item < ApplicationRecord

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :state
belongs_to :delivery_fee
belongs_to :delivery_area
belongs_to :delivery_time

validates :item_name        , :string , presence: true
validates :text             , :text   , presence: true
validates :category_id      , numericality: { other_than: 1 }
validates :state_id         , numericality: { other_than: 1 }
validates :delivery_fee_id  , numericality: { other_than: 1 }
validates :delivery_area_id , numericality: { other_than: 1 }
validates :delivery_time_id , numericality: { other_than: 1 }
validates :price            , :integer , presence: true

end