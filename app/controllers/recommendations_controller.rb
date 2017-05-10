class RecommendationsController < ApplicationController

  def index
  	@friend = User.find(params[:contact_id])
	@user = current_user
	@contacts_to_recommend = @user.recommendable_friends(@friend.location)

	if !Recommendation.find_by(recommender_id: @user.id, user_id: @friend.id) && !Recommendation.find_by(recommender_id: @friend.id, user_id: @user.id)
		@recommended_already = false
	else
		@recommended_already = true
	end
  end

  def create
    @friend = User.find(params[:friend_id])
	@contact = User.find(params[:contact_id])
	if !Recommendation.find_by(recommender_id: current_user.id, user_id: @friend.id)
		@recommended_already = false
		Recommendation.create(user_id: @friend.id, recommended_id: @contact.id, recommender_id: current_user.id)
	else
		@recommended_already = true

	end
	redirect_to "/users/#{current_user.id}" 
  end

end