class ContactsController < ApplicationController

	def index
	  @user = current_user
	  @people = @user.addable_people
	end

	def create
	  @user = current_user
	  @friend = User.find(params[:friend_id])
	  if !Contact.find_by(user_id: @friend.id, friend_id: @user.id) && !Contact.find_by(user_id: @user.id, friend_id: @friend.id)
		Contact.create(user_id: @friend.id, friend_id: @user.id)
		Contact.create(user_id: @user.id, friend_id: @friend.id)
	  end
	  redirect_to "/users/#{@user.id}"
	end
end