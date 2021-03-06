class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: @current_user.id, micropost_id: params[:micropost_id])
    @like.save
    @micropost = Micropost.find_by(id: @like.micropost_id)
    @like_count = Like.where(micropost_id: params[:micropost_id]).count
  end

  def destroy
    @like = Like.find_by(user_id: @current_user.id, micropost_id: params[:micropost_id])
    @micropost = Micropost.find_by(id: @like.micropost_id)
    @like.destroy
    @like_count = Like.where(micropost_id: params[:micropost_id]).count
  end
end
