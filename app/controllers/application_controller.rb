class ApplicationController < ActionController::Base
  include ApplicationHelper 
  protect_from_forgery with: :exception
  before_action :verified_user
  helper_method :current_user

  private

  def verified_user
    redirect_to '/' unless user_is_authenticated
  end

  def user_is_authenticated
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def redirect_if_not_logged_in
    redirect_to '/signin' if !logged_in?
end


end
