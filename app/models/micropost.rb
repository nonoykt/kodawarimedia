class Micropost < ApplicationRecord
  has_many :likes, class_name: 'Like', foreign_key: 'micropost_id', dependent: :destroy
  has_many :likes_user, through: :likes, source: :user
  belongs_to :user
  has_one_attached :picture
  default_scope { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
  #validates :validate_picture

  def resize_picture
    return self.picture.variant(resize: '100x100').processed
  end

  private

  def validate_picture
    if picture.attached?
      if !picture.content_type.in?(%('image/jpeg image/jpg image/png image/gif'))
        errors.add(:picture, 'はjpeg,jpg,png,gif以外は投稿できません')
      elsif picture.blob.byte_size > 5.megabytes
        errors.add(:picture, 'のサイズが５MBを超えています')
      end
    end
  end
end
