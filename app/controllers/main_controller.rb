class MainController < ApplicationController
  def index
    if params[:query] && !params[:query].empty?
      @tweets = TwitterAPI.new.search(params[:query])
    end
  end
end
