class ContractorsController < ApplicationController

  def index
    @contractors = Contractor.all
  end

  def create
    @contractor = Contractor.new(contractor_params)
       if params[:project_id]
        @project = Project.find_by(id: params[:project_id]) 
        @contractor = Contractor.new
        @project.contractor_id = @contractor.id
        @project.save
       end
  
      if @contractor.save 
          redirect_to project_contractors_path(@project)
      else
          render :new
      end
  end

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
      @contractor = Contractor.find_by(id: params[:id])
      @contractor.update(attraction_params)
      redirect_to contractor_path(@contractor)
    end

    def delete
      @contractor = Contractor.find(params[:id])
    end

    def destroy
      @contractor = Contractor.find(params[:id])
      @contractor.destroy
      redirect_to contractors_path
    end


    private

  def contractor_params
    params.require(:contractor).permit(:name, :email, :project_id)
  end

end
