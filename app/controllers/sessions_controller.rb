class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user.try(:authenticate, params[:password])
      sign_in(user)
      redirect_to root_url, :notice => 'Logged in!'
    else
      flash.now.alert = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to new_session_path, :notice => 'Logged out!'
  end
end
