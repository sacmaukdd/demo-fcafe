class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :shop
end
