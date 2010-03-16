class AuthsController < ApplicationController
  def create
    @user = User.find(params[:id])
    login(@user)
    redirect_to chats_path, :notice => 'Logged in successfully'
  end

  def destroy
    logout
    redirect_to users_path, :notice => 'Logged out'
  end
end
