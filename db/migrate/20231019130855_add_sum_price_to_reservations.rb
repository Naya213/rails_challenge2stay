class AddSumPriceToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :sum_price, :integer
  end
end
