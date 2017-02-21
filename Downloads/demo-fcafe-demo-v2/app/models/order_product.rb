class OrderProduct < ApplicationRecord
  belongs_to :user
  belongs_to :table
  
  has_many :order_product_items, dependent: :destroy
end
