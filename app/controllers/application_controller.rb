class ApplicationController < ActionController::Base
  protect_from_forgery wiht: :exception
  include SessionsHelper
end
