class SearchesController < ApplicationController
    before_action :authenticate_user!

    def search
        @word = params[:word]
        @search = params[:search]
        @rooms = Room.looks(params[:search],params[:word])
    end
end
