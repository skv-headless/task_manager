class Web::UsersController < Web::ApplicationController
  def new
    @user = UserRegistrationType.new
  end

  def create
    @user = UserRegistrationType.new(params[:user])
    if @user.save
      f(:success)
      redirect_to new_session_path
    else
      render 'new'
    end
  end
end
