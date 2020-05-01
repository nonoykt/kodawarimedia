class ApplicationController < ActionController::Base
  protect_from_forgery wiht: :exception
  include SessionsHelper

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:warning] = "ログインをしてください"
      redirect_to login_url
    end
  end
  
end
