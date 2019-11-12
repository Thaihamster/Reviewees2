class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    like = current_user&.likes.create(post_id: params[:post_id])
    @post = like.post
  end

  def destroy
    like = current_user&.likes.find_by(post_id: params[:post_id])
    @post = like.post
    like.destroy
  end
end
