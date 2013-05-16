class UsersController < ApplicationController

  def show
    # get the user with id :id
    @user = User.find(params[:id])
  end

  def new
    # init the user variable to be used in the sign up form
    @user = User.new
  end
end
