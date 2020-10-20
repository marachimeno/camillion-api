# Model to create new objects
class New < ApplicationRecord
  #  A new belongs to a user
  belongs_to :user
end
