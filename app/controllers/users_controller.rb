class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/"
    else
      redirect_to '/signup'
    end
  end

  def show
    @user_id = session[:user_id]
    @user = User.find(@user_id)
    @unrecommended = Array.new
    @unfriended = Array.new
    contacts = @user.friends.where(looking_for_contacts: "Yes")
    potentials = @user.recommendeds

    potentials.each do |pot|
      if !Contact.find_by(user_id: @user.id, friend_id: pot.id)
        @unfriended << pot
      end
    end
    
    contacts.each do |c|
      if !Recommendation.find_by(recommender_id: @user.id, user_id: c.id)
        @unrecommended << c
      end
    end

  end

  def update
    if current_user.looking_for_contacts == "Yes"
      current_user.update_attributes(:looking_for_contacts => "No")
    elsif current_user.looking_for_contacts == "No"
      current_user.update_attributes(:looking_for_contacts => "Yes")
    end
    redirect_to "/"
    puts "*"*454
    p current_user.looking_for_contacts
    puts "*"*454
  end


  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :looking_for_contacts, :phone, :location, :email, :password)
    end
end
