class Item < ApplicationRecord

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :state
belongs_to :deliveryfee
belongs_to :deliveryarea
belongs_to :deliverytime

validates :item_name       , :string , presence: true
validates :text            , :text   , presence: true
validates :category_id     , numericality: { other_than: 1 } 
validates :state_id        , numericality: { other_than: 1 } 
validates :deliveryfee_id  , numericality: { other_than: 1 } 
validates :deliveryarea_id , numericality: { other_than: 1 } 
validates :deliverytime_id , numericality: { other_than: 1 } 
validates :price           , :integer , presence: true

end