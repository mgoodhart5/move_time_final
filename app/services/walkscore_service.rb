class WalkscoreService

  def scores(lat, long)
    response = conn.get("/score?format=json&lat=#{lat}&lon=#{long}&transit=1&bike=1&wsapikey=95d08de9ee57b7909acaec121a6633fb")
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("http://api.walkscore.com") do |f|
      f.adapter Faraday.default_adapter
    end
  end

end
