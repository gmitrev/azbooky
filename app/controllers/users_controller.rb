class UsersController < ApplicationController
  def index
    @not_friends = User.all - [current_user] - current_user.friends
  end

  def show
    @user = User.find(params[:id])
    @activities = @user.latest_activities(20)
    @currently_reading_shelf = Shelf.currently_reading(@user)
    @currently_reading = Relationship.where(shelf: @currently_reading_shelf, user: @user).try(:first).try(:book)
    @favourites = @user.relationships.where(favourite: true)
  end

end
