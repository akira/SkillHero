class UserProjectRating
  include Mongoid::Document
  field :rating, :type=>Integer
  field :review, :type=>String
  embedded_in :user_project
  
  validates_presence_of :rating, :review
end