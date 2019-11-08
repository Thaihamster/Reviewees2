class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_post
  before_action :logged_in_user, only: [:new, :create, :edit, :destroy]

  def new
    @review = @post.reviews.build
  end

  def create
    @review = @post.reviews.build(review_params)
    if @review.save
      flash[:success] = "レビューを投稿しました"
      redirect_to post_url(@post)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @review.rating = params[:score].to_i
    if @review.update_attributes(review_params)
      flash[:success] = "レビューを編集しました"
      redirect_to post_url(@review.post)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    flash[:success] = "レビューを削除しました"
    redirect_to post_url(@review.post)
  end

  private

    def review_params
      params.require(:review).permit(:title, :content, :rating, :user_id)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_review
      @review = Review.find(params[:id])
    end

end
