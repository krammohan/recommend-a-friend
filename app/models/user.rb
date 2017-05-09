class User < ApplicationRecord
  has_secure_password

  has_many :contacts
  has_many :friends, through: :contacts
  has_many :recommendations
  has_many :recommendeds, through: :recommendations

  validates :email, presence: true
  validates :email, uniqueness: true

end
