class Post < ApplicationRecord
  belongs_to :user
  has_many   :reviews, dependent: :destroy
  has_many   :likes,   dependent: :destroy

  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :name,    presence: true
  validates :content, presence: true, length: { maximum: 250 }
  validate  :picture_size

  def liked_by?(user)
    likes.find_by(user_id: user.id)
  end

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "ファイルサイズを5メガ以下にしてください")
      end
    end
end
