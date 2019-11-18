class Category < ApplicationRecord
  has_many :posts
  has_many :child_categories
end
