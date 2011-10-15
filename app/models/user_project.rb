class UserProject
  include Mongoid::Document
  field :created_at, :type=>DateTime
  embedded_in :user
  belongs_to :project
end
