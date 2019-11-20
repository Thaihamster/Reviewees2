class ChildCategoriesController < ApplicationController

  def show
    @child_category = ChildCategory.find(params[:id])
  end
end
