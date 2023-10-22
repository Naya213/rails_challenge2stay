class Reservation < ApplicationRecord
    validates :check_in, presence: true
    validates :check_out, presence: true
    validates :person_num, numericality: {greater_than_or_equal_to: 1}, presence: true
    validates :user_id, presence: true
    validates :room_id, presence: true

    validate :check_out_must_after_check_in
    validate :check_in_must_after_today

    def check_out_must_after_check_in
        errors.add(:check_out, "は開始日以降の日付で選択してください。") if check_out.nil? || check_out < check_in
    end

    def check_in_must_after_today
        errors.add(:check_in, "は今日以降のものを選択してください") if check_in.nil? || check_in < Date.today
    end

    belongs_to :user
    belongs_to :room
end
