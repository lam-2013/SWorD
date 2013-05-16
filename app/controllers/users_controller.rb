class UsersController < ApplicationController

  def show
    # get the user with id :id
    @user = User.find(params[:id])
  end

  def new
  end
end
