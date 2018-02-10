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
    urls.map{ |url| es_search_for(page_hits_for_url_query(url)).dig('hits', 'total') }
  end


  def es_connection
    @es_connection ||= Elasticsearch::Client.new url: ENV['ES_URL']
  end


  def es_search_for(query)
    es_connection.search index: 'events', body: query
  end

  def page_hits_for_url_query(url)
    { query: {
        term: {
            page_url: url
        }
    } }
  end

  def to_array(array)
    array.map{ |item| JSON.parse(item) }.flatten
  end


end
