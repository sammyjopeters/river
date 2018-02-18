class AggregatePresenter

  attr_reader :data

  def initialize(data)
    @data = data
    @flat_results = []
  end

  def transform!
    collect_all
    return @flat_results.sort_by { |attribute| [attribute[:date], attribute[:url]] }
  end

  def collect_all
    data.each { |url_and_buckets| splat_with_url(url_and_buckets)}
  end

  def splat_with_url(blob)
    collect_hits(blob[:url].freeze, blob.dig(:aggs, 'aggregations', 'known_urls', 'buckets'))
  end

  def collect_hits(url, buckets)
  	buckets.each do |bucket|
  		@flat_results << { date: bucket['key_as_string'], url: url,  count: bucket['doc_count'] }
  	end
  end

end
