class LocationInfoFacade
  attr_reader :location,
              :population,
              :income

  def initialize(location)
    @location = location
    @population = population
    @income = income
  end

  def population
    ods = ODSService.new(@location)
    ods.population_info[:fields][:population]
  end

  def income
    ods = ODSService.new(@location)
    ods.income_info[:fields][:"2015"]
  end
end
