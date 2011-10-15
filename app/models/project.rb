class Project
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String
  field :skills, :type => String
  field :time, :type => String  
  field :created_at, :type => Date    
  
  belongs_to :user
  belongs_to :non_profit
end
