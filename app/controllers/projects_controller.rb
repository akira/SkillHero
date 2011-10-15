class ProjectsController < InheritedResources::Base
  
  def index
    @projects = Project.all    
  end
  
  def join
    current_user.join_project Project.find(params[:id])
    redirect_to current_user
  end
  
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if current_non_profit.add_project @project
        format.html { redirect_to @project, notice: 'Non profit was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  
end