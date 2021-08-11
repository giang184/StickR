class UsersController < ApplicationController
  before_action :authorize, only: [:show]
  before_action :authorize_admin, only: [:admin, :edit, :destroy] #method, not path

def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  if @user.save
    flash[:notice] = "You've successfully signed up!"
    session[:user_id] = @user.id
    render :show
  else
    flash[:alert] = "There was a problem signing up."
    redirect_to '/signup'
  end
end

def show
  render :show
end

def admin
    @users = User.all
    render :admin_user
end

def edit
  @user = User.find(params[:id])
  render :edit
end

def destroy
  @users = User.all
  @user = User.find(params[:id])
  @user.destroy
  render :admin_user
end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :isAdmin)
    end
end