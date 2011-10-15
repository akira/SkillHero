class ProjectsController < InheritedResources::Base
  
  def index
    @projects = Project.all
  end
  
end