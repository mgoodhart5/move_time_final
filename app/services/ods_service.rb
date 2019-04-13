class ODSService

  def returned_info
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://public.opendatasoft.com") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def response
    conn.get("/api/records/1.0/search/?dataset=us-population-urban-area&sort=year&facet=geography&facet=year")
  end
end
