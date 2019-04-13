class ODSService
  def initialize(location)
    @location = location
  end

  def population_info
    response = conn.get("/api/records/1.0/search/?dataset=us-population-urban-area&q=#{@location}&rows=1&sort=year")
    JSON.parse(response.body, symbolize_names: true)[:records][0]
  end

  def conn
    Faraday.new("https://public.opendatasoft.com") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  # def response
  #   conn.get("/api/records/1.0/search/?dataset=us-population-urban-area&sort=year&facet=geography&facet=year")
  # end
  #
  # def population_response(location)
  #   "/api/records/1.0/search/?dataset=us-population-urban-area&q=Austin%2C+TX&rows=1&sort=year"
  # end
end
