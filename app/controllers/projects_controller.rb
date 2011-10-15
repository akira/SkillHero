class ProjectsController < InheritedResources::Base
  
  def index
    @projects = Project.all    
  end
  
  def join
    current_user.join_project Project.find(params[:id])
    redirect_to current_user
  end
  
end