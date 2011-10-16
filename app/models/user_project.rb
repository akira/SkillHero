class UserProject
  include Mongoid::Document
  field :created_at, :type=>DateTime
  belongs_to :user
  belongs_to :project
end
