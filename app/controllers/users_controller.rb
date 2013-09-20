class UsersController < ApplicationController
  def new
    @user = UserRegistrationType.new
  end

  def create
    @user = UserRegistrationType.new(params[:user])
    if @user.save
      redirect_to new_session_path, :notice => 'Signed up!'
    else
      render 'new'
    end
  end
end
