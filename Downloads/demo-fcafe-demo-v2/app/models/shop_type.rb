class ShopType < ApplicationRecord
  belongs_to :shops_shop_type

  has_many :shops

  validates :name, presence: true, uniqueness: true

  scope :order_date_desc, -> {order created_at: :desc}
end
