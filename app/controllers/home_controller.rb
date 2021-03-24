class HomeController < ApplicationController
  def index
    @users = User.all
    if user_signed_in?
      @user = current_user
      @users = User.where(["id != #{@user.id}"])
    end
  end
end
