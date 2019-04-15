class SearchController < ApplicationController
  def index
    @user = User.first
    @location_info = LocationInfoFacade.new(params[:location])
  end
end
