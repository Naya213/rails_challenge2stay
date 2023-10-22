class Room < ApplicationRecord
    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 1}, presence: true
    validates :address, presence: true

  def self.looks(search,word,word2)
    if search == "partial_match" #キーワード検索
        Room.where("address LIKE?","%#{word}%")
    elsif search == "Multiple_search"
        Room.where("address LIKE? AND name LIKE?","%#{word}%","%#{word2}%").or(Room.where("address LIKE? AND introduction LIKE?","%#{word}%","%#{word2}%"))
    else #エリア検索
        Room.where("address LIKE?","#{word}%")
    end
  end

    belongs_to :user
    has_many :reservations

    mount_uploader :img, ImgUploader
end
