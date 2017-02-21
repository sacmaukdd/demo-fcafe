class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :shop

  scope :of_shop, -> shop_id do
    where shop_id: shop_id
  end
end
