class ContractorsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    # TODO: this may need to be fixed too
    if params[:project_id]
      @project = Project.find_by(id: params[:project_id])
      if @project.nil?
        redirect_to projects_path, alert: "Project not found"
      else
        @contractors = @project.contractors
      end
    else
      @contractors = Contractor.all
    end
  end

  def create
    @contractor = Contractor.new(contractor_params)
      if params[:project_id]
      @project = Project.find_by(id: params[:project_id]) 
      @contractor = Contractor.new
      @project.contractor_id = @contractor.id
      @project.save
      redirect_to project_contractors_path(@project)
       
  
      elsif @contractor = Contractor.new(contractor_params)
         @contractor.save 
         redirect_to contractor_path(@contractor)
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
      @task = Task.new
    end

    def update
      @contractor = Contractor.find_by(id: params[:id])
      @contractor.update(contractor_params)
      redirect_to contractor_path(@contractor)
    end

    def delete
      @contractor = Contractor.find(params[:id])
      @contractor.destroy
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
