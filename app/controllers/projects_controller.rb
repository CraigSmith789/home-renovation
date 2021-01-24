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
    @project = Project.new()
    @project.name = params[:project][:name]

    # user chose an existing contractor
    if params[:contractor_id]
      @project.contractor_id = params[:contractor_id]
      
    # user chose to create a new contractor
    else
      @contractor = Contractor.new()
      @contractor.name = params[:project][:contractors][:name]
      @contractor.email = params[:project][:contractors][:email]
      @contractor.save
      @project.contractor_id = @contractor.id
    end

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
      # update project name
      @project.update(name: params[:project][:name])
     
      # update contractor
      # user chose to create a new contractor
      if params[:project][:contractors][:name] && params[:project][:contractors][:email]
        @contractor = Contractor.new()
        @contractor.name = params[:project][:contractors][:name]
        @contractor.email = params[:project][:contractors][:email]
        @contractor.save
        @project.update(contractor_id: @contractor.id)
      
      # user chose an existing contractor
      else params[:project][:contractor_id]
        @project.update(contractor_id: params[:project][:contractor_id])
      end

      redirect_to project_path(@project)
    end

    def destroy
      @project = Project.find(params[:id])
      @project.destroy
      redirect_to projects_path
    end


    private

  def project_params
    params.require(:project).permit(:name, :home_id, :contractor_id, contractors: [:name, :email] )
  end
end

