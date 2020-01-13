class Message < ApplicationRecord
  belongs_to :account
  mount_uploader :picture,PictureUploader
  validates :message, presence: true
  validate :picture_size

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture,"should be less than 5MB")
    end
  end

end
