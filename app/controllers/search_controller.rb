class SearchController < ApplicationController
  def index
    @location_info = LocationInfoFacade.new(params[:location])
  end
end
