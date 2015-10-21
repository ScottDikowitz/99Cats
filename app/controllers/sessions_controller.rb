
class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    # @user = User.find_by_credentials(
    #   params[:user][:username],
    #   params[:user][:password]
    # )
    unless @user.nil?
      @user.reset_session_token!
      session[:session_token] = @user.session_token
      redirect_to user_url
    else
      redirect_to cats_url
    end
  end

  def destroy
    logout!
   redirect_to new_session_url
  end

  private
  def sessions_params
    params.require(:user).permit(:user_name, :password)
  end
end
