class SessionsController < ApplicationController
  before_action :authorize, only: [:test]
  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:notice] = "You've signed in."
      session[:user_id] = @user.id
      # http://localhost:3000/users/8/images/new
      redirect_to test_path
    else
      flash[:alert] = "There was a problem signing in. Please try again."
      redirect_to signin_path
    end
  end

  def test
    @user = User.find(session[:user_id])
    # @user = User.authenticate(params[:email], params[:password])
    # session[:user_id] = @user.id
    render :test
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've signed out."
    redirect_to "/"
  end
end
