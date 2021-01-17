class ContractorsController < ApplicationController

  def index
    @contractor = Contractor.all
  end

  def create
    @contractor = Contractor.new(contractor_params)
    @contractor.save
    redirect_to contractor_path(@contractor)

    def new
      @contractor = Contractor.new
    end

    def edit 
      @contractor = Contractor.find(params[:id])
    end

    def show
      @contractor = Contractor.find(params[:id])
    end

    def update
      @contractor = C0ntractor.find_by(id: params[:id])
      @contractor.update(attraction_params)
      redirect_to contractor_path(contractor)
    end

    def destroy
      @contractor = Contractor.find(params[:id])
      @contractor.destroy
      redirect_to contractors_path
    end


    private

  def contractor_params
    params.require(:contractor).permit(:name, :email)
  end

end
