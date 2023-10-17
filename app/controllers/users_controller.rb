class UsersController < ApplicationController

  def account
    @user = current_user
  end

  def profile
    @user = current_user
    @user_image = "default_img/default-avatar.png"
    if @user.img.present?
        @user_image = @user.img
    end
  end

  def edit
    @user = current_user
    @path = request.referer
    if @path.include?("account")
        @data = 'account';
    elsif @path.include?("profile")
        @data = 'profile';
    end
  end

  private
  def user_params
    #ストロングパラメータで、名前とメールを受け取ることができるように設定しておく。
    params.require(:user).permit(:name, :email ,:img)
  end
  
end