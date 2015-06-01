class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @activities = @user.latest_activities(20)
  end
end
