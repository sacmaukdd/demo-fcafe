class Album < ApplicationRecord
  has_many :images, dependent: :destroy

  has_one :shop

  validates_uniqueness_of :name, scope: :shop_id

  scope :order_date_desc, -> {order created_at: :desc}
  scope :album_by_shop, -> shop_id do
    where shop_id: shop_id
  end
end
