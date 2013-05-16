class UsersController < ApplicationController

  def show
    # get the user with id :id
    @user = User.find(params[:id])
  end

  def new
    # temporary generate a new user - code to be removed
    if !@user.nil?
      @user = User.create(name: 'Luigi', email: 'luigi.derussis@polito.it', password: 'prova123', password_confirmation: 'prova123')
    end
  end
end
