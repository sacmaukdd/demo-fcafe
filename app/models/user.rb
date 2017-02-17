class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable

  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :order_products, dependent: :destroy
  has_many :order_tables, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :suggestions, dependent: :destroy
  has_many :shops, dependent: :destroy
  
  enum role: [:user, :staff, :shop_owner, :mod, :admin]
  
  validates :user_name, presence: true,
    length: {maximum: Settings.users.name_max_length}
  validates :address, presence: true, 
    length: {maximum: Settings.users.address_max_length}
  validates :phone_number, presence: true, 
    length: {maximum: Settings.users.phone_max_length}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, 
    length: {maximum: Settings.users.email_max_length}, 
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, 
    length: {minimum: Settings.users.password_min_length}, allow_nil: true

  mount_uploader :avatar, PictureUploader
  validate :image_size
  
  scope :newest, ->{order created_at: :desc}
  
  private
  def image_size
    if avatar.size > Settings.users.image_max_size
      errors.add :avatar, I18n.t("users.max_size_error")
    end
  end
end
