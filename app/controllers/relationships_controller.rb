class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    following = current_user.follow(@user)
    following.save
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
    redirect_to @user
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    unfollowing = current_user.unfollow(@user)
    unfollowing.save
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
    redirect_to @user
  end
end
