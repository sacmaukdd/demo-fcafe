class Suggestion < ApplicationRecord
  acts_as_paranoid
  belongs_to :shop
    
  enum status: [:processing, :rejected, :accepted]
  
  validates :name, presence: true, 
    length: {maximum: Settings.suggestions.name_max_length}
  validates :description, presence: true,
    length: {maximum: Settings.suggestions.description_max_length}
  mount_uploader :image, PictureUploader

  scope :newest, ->{order created_at: :desc}

  private
  def image_size
    if image.size > Settings.images.image_max_size
      errors.add :image, I18n.t("images.max_size_error")
    end
  end
end
