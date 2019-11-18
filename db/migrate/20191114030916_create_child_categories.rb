class CreateChildCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :child_categories do |t|
      t.string :name
      t.integer :category_id

      t.timestamps
    end
  end
end
