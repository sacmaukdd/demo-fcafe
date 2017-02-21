class Category < ApplicationRecord
  acts_as_nested_set
  belongs_to :shop

  has_many :products, dependent: :destroy

  validates :name, presence: true, 
    length: {maximum: Settings.categories.name_max_length}, 
    uniqueness: true

  scope :newest, ->{order created_at: :desc}
  scope :by_shop, ->shop_id do
    where("shop_id = ? or shop_id is null", shop_id)
  end
end
