class AddChildCategoryIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :child_category_id, :integer
  end
end
