class ProjectsController < ApplicationController
  before_action :redirect_if_not_logged_in

  

  def index 
       
    if params[:home_id] && @home = Home.find(params[:home_id])
        @projects = @home.projects
        
    else 
      @projects = Project.joins(:home).where({"homes.user_id" => current_user.id})
    end
  end

  def show
    
    @project = Project.find(params[:id])
    #@contractor = Contractor.find(params[:contractor_id])
    @contractor = @project.contractor.id
  end

  def new
    
    if params[:home_id] && @home = Home.find(params[:home_id])
       @project = Project.new(home_id: params[:home_id])
       @contractors = Contractor.all
              
  else
      @project = Project.new
      @project.build_home
  end
end

  def create

    @project = Project.new(project_params)
    
    
       if params[:home_id] 
           @home = Home.find(params[:home_id])
           @project.home = @home
       end
  
      if @project.save 
          redirect_to home_projects_path
      else
          render :new
      end
  end

    

    def edit 
      @project = Project.find(params[:id])
    end

    

    def update
      @project = Project.find_by(id: params[:id])
      @project.update(project_params)
      redirect_to project_path(@project)
    end

    def destroy
      @project = Project.find(params[:id])
      @project.destroy
      redirect_to projects_path
    end


    private

  def project_params
    params.require(:project).permit(:name, :home_id, contractors_attributes: [:name,:id] )
  end
end

