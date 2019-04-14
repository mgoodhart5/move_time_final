class ODSService
  def initialize(location)
    @location = location
  end

  def population_info
    response = conn.get("/api/records/1.0/search/?dataset=us-population-urban-area&q=#{@location}&rows=1&sort=year")
    JSON.parse(response.body, symbolize_names: true)[:records][0]
  end

  def income_info
    response = conn.get("/api/records/1.0/search/?dataset=real-per-capita-income-by-metropolitan-statistical-area&q=#{@location}&rows=1")
    JSON.parse(response.body, symbolize_names: true)[:records][0]
  end

  def demographics_info
    response = conn.get("/api/records/1.0/search/?dataset=us-cities-demographics&q=#{@location}&facet=city&facet=state")
    JSON.parse(response.body, symbolize_names: true)[:records][0][:fields]
  end

  def conn
    Faraday.new("https://public.opendatasoft.com") do |f|
      f.adapter Faraday.default_adapter
    end
  end


end
