class TasksController < ApplicationController
  def index
    if params[:contractor_id] && @contractor = Contractor.find(params[:contractor_id])
      @tasks = @contractor.tasks
      
    else 
      @tasks = Task.all
    end
  end

  def create
    @task = Task.new(task_params)
    if params[:contractor_id] 
      @task.contractor_id = params[:contractor_id]
  end
    @task.save
    redirect_to contractor_tasks_path
  end

    def new
      @task = Task.new
    end

    def edit 
      @task = Task.find(params[:id])
    end

    def show
      @task = Task.find(params[:id])
    end

    def update
      @task = Task.find_by(id: params[:id])
      @task.update(task_params)
      redirect_to task_path(@task)
    end

    def destroy
      @task = Task.find(params[:id])
      @task.destroy
      redirect_to taskss_path
    end


    private

  def task_params
    params.require(:task).permit(:name, :contractor_id)
  end
end
