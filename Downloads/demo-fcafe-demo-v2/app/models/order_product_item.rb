class OrderProductItem < ApplicationRecord
  belongs_to :product
  belongs_to :order_product
end
