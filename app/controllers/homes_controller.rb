class HomesController < ApplicationController
  #skip_before_action :verified_user, only: [:new, :create]
  before_action :redirect_if_not_logged_in

  def index
      @user = current_user
      @homes = @user.homes.order_by_date
      
    
  end
  

  def new
    @home = Home.new
  end

  def create
    @home = Home.new(home_params)
    @home.user_id = current_user.id
      if @home.save
      redirect_to home_path(@home)
      else 
        render ('new')
      end
  end

    def new
      @home = Home.new
    end

    def edit 
      @home = Home.find(params[:id])
    end

    def show
      @home = Home.find(params[:id])
      if @home.user_id != current_user.id
        @authorized = false
      else
        @authorized = true
      
      end
      
    end

    def update
      @home = Home.find_by(id: params[:id])
      @home.update(home_params)
      redirect_to home_path(@home)
    end

    def delete
      @home = Home.find_by(id: params[:id])
    end


    def destroy
      @home = Home.find(params[:id])
      @home.destroy
      redirect_to homes_path
    end

    def lead_paint
      Home.all.lead_paint_risk
    end



    private

    

    def home_params
      params.require(:home).permit(:name, :year_built, :sf, :beds, :baths)
    end

end
