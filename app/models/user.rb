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
  
  has_many :projects
  
  def join_project(project)
    projects << project
    save!
  end
end
