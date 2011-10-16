class UserBadgesController < InheritedResources::Base
  def create
    @user_badge = current_user.user_badges.new(params[:user_badge])

    respond_to do |format|
      if @user_badge.save
        session[:user_badge_id] = @user_badge.id
        format.html { redirect_to @user_badge, notice: 'Non profit was successfully created.' }
        format.json { render json: @user_badge, status: :created, location: @user_badge }
      else
        format.html { render action: "new" }
        format.json { render json: @user_badge.errors, status: :unprocessable_entity }
      end
    end
  end  
  
  def index
    @user_badges= current_user.user_badges
  end
  
  def show
    @user_badge = current_user.user_badges.find(params[:id])
  end
end