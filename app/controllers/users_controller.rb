class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    @user_image = "default_img/default-avatar.png"
    if @user.img.present?
       @user_image = @user.img
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    #ストロングパラメータで、名前とメールを受け取ることができるように設定しておく。
    params.require(:user).permit(:name, :email ,:img)
  end
end