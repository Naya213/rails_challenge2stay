class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservations = Reservation.where(user_id: @user)
  end

  def new
  end

  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :person_num, :user_id, :room_id))

    if @reservation.invalid?
      flash[:notice] = "予約情報が不足しています"
      @user = User.find_by(params[:reservation][:user_id])
      @room = Room.find_by(params[:reservation][:room_id])
      render "rooms/show"
    else
      @stay_days = (@reservation.check_out - @reservation.check_in).to_i
      @reservation_room = Room.find(params[:reservation][:room_id])
      @sum_price = @reservation_room.price * @reservation.person_num * @stay_days
    end


  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :person_num, :sum_price, :user_id, :room_id))

     if @reservation.save
       flash[:notice] = "予約完了しました"
       redirect_to :reservations
     else
       render "reservations/confirm"
     end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約を削除しました"
    redirect_to :reservations
  end
end
