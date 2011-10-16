class UserProject
  include Mongoid::Document
  field :created_at, :type=>DateTime
  belongs_to :user
  belongs_to :project
  embeds_one :user_project_rating
end
