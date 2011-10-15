class ProjectsController < InheritedResources::Base
  
  def index
    @projects = Project.all    
  end
  
  def join
    current_user.projects.concat Project.find(params[:id])
    redirect_to current_user
  end
  
end