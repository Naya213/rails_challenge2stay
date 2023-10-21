class RoomsController < ApplicationController
  def index
    @users = User.all
    @rooms = Room.all

    @word = params[:word]
    @word2 = params[:word2]
    @search = params[:search]
    @search_rooms = Room.looks(params[:search],params[:word],params[:word2])
  end

  def new
    @user = current_user
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :price, :address, :img, :user_id))

    @room_image = "default_img/default-room.png"
    if @room.img.present?
        @room_image = @room.img
    end

     if @room.save
       flash[:notice] = "新規施設登録をしました"
       redirect_to :rooms
     else
       @user = User.find_by(params[:room][:user_id])
       render "rooms/new"
     end
  end

  def show
    @room = Room.find(params[:id])

    # 以下は予約機能で使用する
    @user = current_user
    @reservation = Reservation.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def own
    @user = current_user
    @rooms = @user.rooms
  end
end
