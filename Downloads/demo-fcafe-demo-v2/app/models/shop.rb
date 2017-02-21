class Shop < ApplicationRecord
  belongs_to :user
  belongs_to :shop_type

  has_many :tables, dependent: :destroy
  has_many :coupons, dependent: :destroy
  has_many :rates
  has_many :comments
  has_many :categories
  has_many :albums, dependent: :destroy
  has_many :suggestions, dependent: :destroy

  delegate :name, to: :shop_type, prefix: "shop_type", allow_nil: true

  enum status: [:waiting, :approved, :rejected]

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true

  mount_uploader :avatar, PictureUploader

  scope :order_date_desc, -> {order created_at: :desc}
  scope :shop_by_user, -> user_id do
    where user_id: user_id
  end

  def avg_rate
    rate = Rate.of_shop self.id
    total_rate = 0
    rate.each do |shop|
      total_rate  = shop.num_rate.to_f
    end
    total_rate/rate.size.to_i unless rate.size.to_i == 0
  end
end
