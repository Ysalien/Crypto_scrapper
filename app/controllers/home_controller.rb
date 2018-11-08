class HomeController < ApplicationController

  def index
    @scrapping = StartScrap.new.perform
    @all_crypto = params[:all_crypto] #hash from start_scrap
  end

end
