class Table < ApplicationRecord
  belongs_to :shop
  
  has_many :order_tables, dependent: :destroy
  has_many :order_products, dependent: :destroy

  enum status: [:unavailable, :available]

  mount_uploader :avatar, PictureUploader
  validate :image_size

  scope :by_status, ->status{where status: status}

  private
  def image_size
    if avatar.size > Settings.images.image_max_size
      errors.add :avatar, I18n.t("images.max_size_error")
    end
  end
end
