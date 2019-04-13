class LocationInfoFacade
  attr_reader :location,
              :population
              
  def initialize(location)
    @location = location
    @population = population
  end

  def population
    ods = ODSService.new(@location)
    ods.population_info[:fields][:population]
  end
end
