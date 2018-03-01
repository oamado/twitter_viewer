class MainController < ApplicationController
  def index
    if params[:query]
      @tweets = TwitterAPI.new.search(params[:query])
      puts @tweets[0]
    end
  end
end
