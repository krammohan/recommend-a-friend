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
  end


  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :looking_for_contacts, :phone, :location, :email, :password)
    end
end
