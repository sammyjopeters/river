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
     aggs: {
         page_views_over_time: {
             date_histogram: {
                 field: 'derived_tstamp',
                 interval: interval,
                 format: 'yyyy-MM-dd'
             }
         }
     }
    }
  end

  def to_array(array)
    if array.is_a?(String)
      JSON.parse(array) if array.is_a?(String)
    else
      array.map{ |item| JSON.parse(item) }.flatten
    end
  end

  def to_epoch(time)
    time.to_i
  end

end
