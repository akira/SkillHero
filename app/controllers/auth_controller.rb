class AuthController < ApplicationController
  
  
  def callback
    puts request.env['omniauth.auth'].to_yaml
    redirect_to root_url
  end
end