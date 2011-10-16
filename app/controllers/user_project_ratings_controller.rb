class UserProjectRatingsController < InheritedResources::Base
  
  def create
    @user = User.find(params[:user_id])
    @user_project = @user.user_projects.find(params[:user_project_id])
    puts "USER PROJECT: #{@user_project.to_yaml}"
    @user_project.user_project_rating = UserProjectRating.new(params[:user_project_rating])
    @user_project_rating = @user_project.user_project_rating
    respond_to do |format|
      if @user_project_rating.save
        format.html { redirect_to @user_project.project, notice: 'Rating was successfully created.' }
        format.json { render json: @user_project_rating, status: :created, location: @user_project_rating }
      else
        format.html { render action: "new" }
        format.json { render json: @user_project_rating.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @user = User.find(params[:user_id])
    @user_project = @user.user_projects.find(params[:user_project_id])
    @user_project_rating = @user_project.user_project_rating
  end
    
  # PUT /user_project_ratings/1
  # PUT /user_project_ratings/1.json
  def update
    @user = User.find(params[:user_id])
    @user_project = @user.user_projects.find(params[:user_project_id])
    @user_project_rating = @user_project.user_project_rating
    respond_to do |format|
      if @user_project_rating.update_attributes(params[:user_project_rating])
        format.html { redirect_to @user_project.project, notice: 'Non profit was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_project_rating.errors, status: :unprocessable_entity }
      end
    end
  end

end