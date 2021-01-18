class HomesController < ApplicationController

  def index
    @homes = Home.all
  end

  def create
    @home = Home.new(home_params)
    @home.save
    redirect_to home_path(@home)
  end

    def new
      @home = Home.new
    end

    def edit 
      @home = Home.find(params[:id])
    end

    def show
      @home = Home.find(params[:id])
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


    private

  def home_params
    params.require(:home).permit(:name, :year_built, :sf, :beds, :baths)
  end

end
