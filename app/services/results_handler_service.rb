class ResultsHandlerService

  attr_reader :urls, :before_time, :after_time, :interval

  def initialize(params)
    @urls = to_array(params[:urls])
    @before_time = params[:before]
    @after_time = params[:after]
    @interval = params[:interval]
  end

  def render
    list_hits_for_urls
  end


  def list_hits_for_urls
    urls.map{ |url| es_search_for(hits_for_url_within_range(url)).dig('hits', 'total') }
  end


  def es_connection
    @es_connection ||= Elasticsearch::Client.new url: ENV['ES_URL']
  end


  def es_search_for(query)
    es_connection.search index: 'events', body: query
  end

  def hits_for_url_within_range(url)
    {query: {
        bool: {
            must: {
                range: {
                    derived_tstamp: {
                        gte: after_time,
                        lte: before_time
                    }
                }
            },
            filter: {
                term: {
                    page_url: url
                }
            }
        }
    }}



  end

  def to_array(array)
    array.map{ |item| JSON.parse(item) }.flatten
  end

  def to_epoch(time)
    time.to_i
  end

end
