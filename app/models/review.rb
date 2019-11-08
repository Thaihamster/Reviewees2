class Review < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :user_id, presence: true
  validates :title,   presence: true
  validates :rating,  presence: true
  validates :content, length: { maximum: 140 }

  scope :desc, -> { order("reviews.created_at DESC") }
end
