class ResultsHandlerService

  attr_reader :urls, :before_time, :after_time, :interval

  def render
    es_connection.cluster.health
  end

  def es_connection
    Elasticsearch::Client.new url: ENV['ES_URL']
  end

end
