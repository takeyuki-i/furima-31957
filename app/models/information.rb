class Information < ApplicationRecord

  with_options presence: true do
    validates :zip_code
    validates :city
    validates :addres1
    validates :tell_num
  end

  validates :state_id , numericality: { other_than: 1 }

  belongs_to :order
end