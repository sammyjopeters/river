class ResultsHandlerService

  attr_reader :urls, :before_time, :after_time, :interval

  def initialize(params)
    @urls = params[:urls].split(',')
    @before_time = DateTime.parse(params[:before]).to_s
    @after_time = DateTime.parse(params[:after]).to_s
    @interval = params[:interval]
  end

  def render
    list_hits_for_urls
  end

  def list_hits_for_urls
    urls.map{ |url| es_search_for(hits_for_url_within_range(url)) }
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
    },
     aggs:  {
         known_urls: {
             date_histogram: {
                 field:    'derived_tstamp',
                 interval: interval,
                 format:   'yyyy-MM-dd-hh-mm-ss'
             }
         }
     }}
  end

end
