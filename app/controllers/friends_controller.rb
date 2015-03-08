class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def invite
    user = User.find(params[:id])
    user.invite(current_user)

    redirect_to :back, notice: "Friend request sent!"
  end

  def approve
    user = User.find(params[:id])
    current_user.approve(user)
    user.approve(current_user)

    redirect_to :back, notice: "You and #{user.email} are now friends!"
  end
end
