class ChildCategory < ApplicationRecord
  has_many :posts
  belongs_to :category
end
