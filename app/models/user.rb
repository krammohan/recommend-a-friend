class User < ApplicationRecord
  has_secure_password

  has_many :contacts
  has_many :friends, through: :contacts
  has_many :recommendations
  has_many :recommendeds, through: :recommendations

  validates :email, presence: true
  validates :email, uniqueness: true

  def add_people
    people = User.all
    can_add = Array.new
    people.each do |person|
      if !self.friends.include?(person) && person != self
        can_add << person
      end
    end
    return can_add
  end

  def recommend_friends(location)
    people_to_recommend = Array.new
    self.friends.each do |friend|
      if friend.looking_for_contacts == "Yes" && friend.location == location
        people_to_recommend << friend
      end 
    end
    return people_to_recommend
  end


end
