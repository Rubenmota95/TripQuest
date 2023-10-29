class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @favorite_places = @user.places
  end

  def admin?
    current_user.role == "admin"
  end
end
