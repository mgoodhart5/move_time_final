class QODService

  def quote
    response = conn.get("/qod.json")
    JSON.parse(response.body, symbolize_names: true)[:contents][:quotes][0]
  end

  def conn
    Faraday.new("http://quotes.rest") do |f|
      f.adapter Faraday.default_adapter
    end
  end

end
