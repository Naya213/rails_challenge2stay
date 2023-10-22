class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :check_in
      t.date :check_out
      t.integer :person_num
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
