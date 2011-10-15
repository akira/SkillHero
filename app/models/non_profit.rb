class NonProfit
  include Mongoid::Document
  field :name, :type => String
  field :address, :type => String
  field :city, :type => String
  field :state, :type => String  
  field :zip, :type => String    
  field :phone, :type => String      
  field :email, :type => String        
end
