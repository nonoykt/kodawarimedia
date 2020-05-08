class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[edit update destroy following followers]
  before_action :correct_user, only: %i[edit update]
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      redirect_to @user, notice: "ユーザー登録が完了しました"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = "プロフィールの更新に成功しました"
      redirect_to @user
    else
      flash.now[:danger] = "プロフィールの編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(20)
    @micropost = current_user.microposts.build
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(20)
    @micropost = current_user.microposts.build
    render 'show_follow'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
