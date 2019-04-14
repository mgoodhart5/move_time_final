class LocationInfoFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def population
    ods = ODSService.new(@location)
    ods.population_info[:fields][:population]
  end

  def income
    ods = ODSService.new(@location)
    @_income || ods.income_info[:fields][:"2015"]
  end

  def walkscore
    @_walkscore || score_service[:walkscore] || "unavailable for this city"
  end

  def bikescore
    @_bikescore || score_service[:bike][:score] || "unavailable for this city"
  end

  def geo_service
    GeoService.new(@location)
  end

  def score_service
    ss = ScoreService.new
    ss.scores(geo_service.latitude, geo_service.longitude)
  end

end
