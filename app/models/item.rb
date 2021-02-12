class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :delivery_area
  belongs_to :delivery_time
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :delivery_area_id
    validates :delivery_time_id
    validates :price, numericality: true, format: { with: /[0-9]/ }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :delivery_area_id
    validates :delivery_time_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9_999_999 }

  belongs_to :user
end
