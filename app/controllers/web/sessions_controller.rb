class Web::SessionsController < Web::ApplicationController
  def new
    @session = UserSignInType.new
  end

  def create
    @session = UserSignInType.new(params[:user_sign_in_type])

    if @session.valid?
      user = @session.user
      sign_in(user)
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_session_path
  end
end
