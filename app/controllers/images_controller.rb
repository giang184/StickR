class ImagesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @image = @user.images.new
    render :new
  end

  def create
    @user = User.find(params[:user_id])
    @image = @user.images.new(image_params)
    if @image.save
      flash[:notice] = "Image uploaded"
      redirect_to  user_image_path(@user)
    else
      flash[:error] = "There was a problem uploading your image."
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @image = Image.find(params[:id])
    render :show
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to user_image_path(@user)
  end

  private
  def image_params
    params.require(:image).permit(:url, :description)
  end 

end