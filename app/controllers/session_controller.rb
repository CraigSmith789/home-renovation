class SessionController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    # facebook login
    if request.env['omniauth.auth']
      @user = User.find_or_create_by_auth(request.env['omniauth.auth'])
      if @user
        session[:user_id] = @user.id
        
      else
        redirect_to root_path
      end

    # regular form login  
    elsif 
      @user = User.find_by(name: params[:name])
      session[:user_id] = @user.id

    else
      render 'new'
    end
    redirect_to homes_path

  end


  def destroy
    session.delete("user_id")
    redirect_to root_path
  end

end
