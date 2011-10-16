class User
  include Mongoid::Document
  field :first_name
  field :last_name
  field :email
  field :password  
  field :profile_image_url
  field :job_title
  field :location
  field :linked_in_url
  field :linked_in_uid
  field :link_in_token
  field :link_in_secret
  field :skills
  field :experience    
  
  has_many :user_projects    
  
  def join_project(project)
    user_projects.create! :project=>project
    save!
  end
end
