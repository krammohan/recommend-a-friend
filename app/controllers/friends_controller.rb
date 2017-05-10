class FriendsController < ApplicationController
  
  def index
    @user = current_user
    @contacts = @user.friends
  end

  def new
    @friend = User.find(params[:friend_id])
  end

  def create
	number = "+1" + User.find(params[:friend_id]).phone
	body = "#{params[:body]} - From #{current_user.first_name} #{current_user.last_name}"
	@client = Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']
 
 	@client.messages.create(
	  from: '+16696005418',
	  to: number,
	  body: body
	)
	redirect "/users/#{current_user.id}/contacts"

  end

end