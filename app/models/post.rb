class Post < ApplicationRecord
  belongs_to :user
  has_many   :reviews, dependent: :destroy

  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :name,    presence: true
  validates :content, presence: true, length: { maximum: 250 }
  validate  :picture_size

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "ファイルサイズを5メガ以下にしてください")
      end
    end
end
