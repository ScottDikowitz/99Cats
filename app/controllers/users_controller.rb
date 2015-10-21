
class UsersController < ApplicationController

def create
  @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to user_url
    else
      render json: @user.errors.full_messages
    end
end

def new
  @user = User.new
end

def show
  @current_user = current_user
  # @user = User.all
end

private

def user_params
  params.require(:user).permit(:user_name, :password)
end

end
