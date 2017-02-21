class Product < ApplicationRecord
  belongs_to :category
  belongs_to :album
  
  has_many :comments
  has_many :rates
  has_many :order_product_items, dependent: :destroy
end
