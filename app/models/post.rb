class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :child_category
  has_many   :reviews, dependent: :destroy
  has_many   :likes,   dependent: :destroy

  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id,     presence: true
  validates :name,        presence: true
  validates :content,     presence: true, length: { maximum: 250 }
  validates :category_id, presence: true
  validate  :picture_size

  def liked_by?(user)
    likes.find_by(user_id: user.id)
  end

  def self.fetch_popular_posts
    Post.all.preload(:category, :reviews).sort_by { |post| post.reviews.count }.reverse
  end

  def self.fetch_latest_posts
    Post.preload(:category, :reviews).order(id: "desc")
  end
  
  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "ファイルサイズを5メガ以下にしてください")
      end
    end
end
