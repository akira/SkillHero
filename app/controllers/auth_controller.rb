class AuthController < ApplicationController
  
  
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
    redirect_to user_url(@user.id)
  end
  
  def logout
    [:user_id, :non_profit_id].each{|key| session[key] = nil}
    redirect_to root_url
  end  
end