class LocationInfoFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def population
    ods = ODSService.new(@location)
    @_population || ods.population_info[:fields][:population]
  end

  def income
    @_income || ods_service.income_info[:fields][:"2015"]
  end

  def walkscore
    @_walkscore || score_service[:walkscore] || "unavailable for this city"
  end

  def bikescore
    @_bikescore || score_service[:bike][:score] || "unavailable for this city"
  end

  def veterans
    @_veterans || ods_service.demographics_info[:number_of_veterans]
  end

  def median_age
    @_median_age || ods_service.demographics_info[:median_age]
  end

  def household_size
    @_household_size || ods_service.demographics_info[:average_household_size]
  end

  def quote
    @_quote || qod_service.quote
  end

  def ods_service
    ODSService.new(@location)
  end

  def geo_service
    GeoService.new(@location)
  end

  def qod_service
    QODService.new
  end

  def score_service
    ss = ScoreService.new
    ss.scores(geo_service.latitude, geo_service.longitude)
  end

end
