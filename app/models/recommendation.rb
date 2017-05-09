class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :recommended, :class_name => "User"
end
