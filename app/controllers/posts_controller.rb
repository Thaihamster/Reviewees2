class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: [:edit, :destroy]

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @reviews = @post.reviews.paginate(page: params[:page], per_page: 3)
    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(1)
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "お気に入りの日用品を投稿しました"
      redirect_to root_url
    else
      render 'posts/new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "投稿を編集しました!"
      redirect_to post_url
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to root_url
  end

  def get_category_children
    @category_children = ChildCategory.where(category_id: params[:category_id])
  end

  private

    def post_params
      params.require(:post).permit(:name, :content, :picture, :category_id, :child_category_id)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
