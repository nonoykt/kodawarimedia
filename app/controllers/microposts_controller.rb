class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user, only: :destroy

  def index
    @microposts = Micropost.all.page(params[:page]).per(10)
  end

  def timeline
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.page(params[:page]).per(10)
    else
      @microposts = Micropost.all
    end
  end

  def show
    @user = User.find(Micropost.find(params[:id]).user_id)
    @micropost = Micropost.find(params[:id])
  end

  def edit
  end

  def update
  end

  def create
    @user = current_user
    @micropost = current_user.microposts.build(micropost_params)

    if @micropost.save
      redirect_to root_url, notice: "投稿しました"
    else
      @feed_items = []
      render current_user
    end
  end

  def edit
    @micropost = current_user.micropost.find_by(id: params[:id]) || nil
    if @micropost.nil?
      notice[:warning] = "編集権限がありません"
      redirect_to root_url
    end
  end

  def update
    @micropost = current_user.micropost.find_by(id: params[:id])
    @micropost.update_attributes(micropost_params)

    if @micropost.save
      flash[:success] = "編集が完了しました"
      redirect_to current_user
    else
      render :edit
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "ポストが削除されました"
    redirect_to request.refferer || microposts_url
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
