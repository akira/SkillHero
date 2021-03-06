#TODO: plugin devise later
class AuthController < ApplicationController
  
  #TODO: this is only a demo.  Please bcrypt password
  def callback
    puts request.env['omniauth.auth'].to_yaml
    info = request.env['omniauth.auth']
    user_info = request.env['omniauth.auth']['user_info']
    existing_user = User.first(conditions: {linked_in_uid: info['uid']})
    if(existing_user)
      @user = existing_user
    else
      @user = User.create! :first_name=>user_info['first_name'], 
        :last_name=>user_info['last_name'], 
        :location=>user_info['location'], 
        :profile_image_url=>user_info['image'],       
        :linked_in_url=>user_info['urls']['LinkedIn'],             
        :job_title=>user_info['description'], 
        :linked_in_uid=>info['uid'], 
        :linked_in_token=>info['credentials']['token'], 
        :linked_in_secret=>info['credentials']['secret']      
    end      
    session[:user_id] = @user.id        
    if(!@user.email.blank?)
      redirect_to user_url(@user.id)      
    else
      redirect_to edit_user_url(@user.id)        
    end
  end
  
  def non_profit_login
    @non_profit = NonProfit.new(params[:non_profit])    
    if(request.post?)
      existing_non_profit = NonProfit.first(conditions: {email: @non_profit.email, password: @non_profit.password})
      if(existing_non_profit)
        session[:non_profit_id] = existing_non_profit.id
        redirect_to existing_non_profit
      else
        @non_profit.errors.add(:base, "Incorrect username or password")
      end
    else
      #render
    end  
  end
  
  
  
  def logout
    [:user_id, :non_profit_id].each{|key| session[key] = nil}
    redirect_to root_url
  end  
end