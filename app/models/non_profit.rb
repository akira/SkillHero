class NonProfit
  include Mongoid::Document
  field :name, :type => String
  field :address, :type => String
  field :city, :type => String
  field :state, :type => String  
  field :zip, :type => String    
  field :phone, :type => String      
  field :email, :type => String        
  field :password, :type => String  
  
  validates_presence_of :name, :email, :password, :city, :state
  has_many :projects
  
  def add_project(project)
    project.save!
    projects << project
    self.save!
  end
end
