class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :state
belongs_to :delivery_fee
belongs_to :delivery_area
belongs_to :delivery_time
has_one_attached :image

with_options presence: true do
validates :name  , :string
validates :text  , :text
validates :price , :integer
end

with_options numericality: { other_than: 1 } true do
validates :category_id
validates :state_id
validates :delivery_fee_id
validates :delivery_area_id
validates :delivery_time_id
end