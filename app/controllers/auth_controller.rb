class AuthController < ApplicationController
  
  
  def callback
    redirect_to root_url
  end
end