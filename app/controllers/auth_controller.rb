class AuthController < ApplicationController
  
  
  def callback
    puts request.env['omniauth.auth'].to_yaml
    auth_info = request.env['omniauth.auth']['user_info']
    @user = User.create! :first_name=>auth_info['first_name'], 
      :last_name=>auth_info['last_name'], 
      :location=>auth_info['location'], 
      :profile_image_url=>auth_info['image'],       
      :linked_in_url=>auth_info['urls']['LinkedIn'],             
      :job_title=>auth_info['description']
    session[:user_id] = @user.id        
    redirect_to user_url(@user.id)
  end
  
  def logout
    [:user_id, :non_profit_id].each{|key| session[key] = nil}
    redirect_to root_url
  end  
end