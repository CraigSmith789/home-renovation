class UsersController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    byebug
    if (user = User.create(user_params))
      session[:user_id] = user.id
      redirect_to homes_path
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

end
