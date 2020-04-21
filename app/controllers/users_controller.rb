class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy ]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "user saved"
    else
      render :new
    end
  end

  def update
    @user.update(user_params)
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.requier(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
