class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def show
    @user    = User.find(params[:id])
    @posts   = @user.posts.paginate(page: params[:page], per_page: 6)
    @reviews = @user.reviews.paginate(page: params[:page], per_page: 5)
    @likes   = @user.likes.paginate(page: params[:page], per_page: 6)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "登録が完了しました！"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "プロフィールを編集しました!"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to root_url
  end

  private

    def user_params
      params.require(:user).permit(:name,
                                   :email,
                                   :image,
                                   :password,
                                   :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        flash[:danger] = "権限がありません"
        redirect_to root_url
      end
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
