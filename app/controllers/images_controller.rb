class ImagesController < ApplicationController
  before_action :authorize, only: [:new, :edit, :show]

  def new
    @user = User.find(params[:user_id])
    @image = @user.images.new
    render :new
  end

  def edit 
    @user = User.find(params[:user_id])
    @image = Image.find(params[:id])
    render :edit
  end

  def update
    @image = Image.find(params[:id])
    @user = User.find(params[:user_id])
    if @image.update(image_params)
      redirect_to user_image_path(@user, @image)
    else
      render :edit
    end
  end

  def create
    @user = User.find(params[:user_id])
    @image = @user.images.new(image_params)
    if @image.save
      flash[:notice] = "Image uploaded"
      redirect_to  user_image_path(@user, @image)
    else
      flash[:error] = "There was a problem uploading your image."
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @image = Image.find(params[:id])
    @images = @user.images
    render :show
  end

  def destroy
    @user = User.find(params[:user_id])
    @image = Image.find(params[:id])
    @image.destroy
    render :show
  end

  private
  def image_params
    params.require(:image).permit(:url, :description)
  end 

end