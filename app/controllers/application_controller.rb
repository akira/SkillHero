class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_non_profit
    @current_non_profit ||= session[:non_profit_id] ? NonProfit.find(session[:non_profit_id]) : nil
  end
  
  def current_user
    @current_user ||= session[:user_id] ? User.find(session[:user_id]) : nil    
  end
  
  def current_company
    @current_company ||= session[:current_company_id] ? Company.find(session[:current_company_id]) : nil        
  end
  
end
