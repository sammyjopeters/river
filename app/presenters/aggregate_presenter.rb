class AggregatePresenter

  attr_reader :data

  def initialize(data)
    @data         = data
    @flat_results = []
  end

  def transform!
    collect_all
    match_with_labels(@flat_results)
  end

  def collect_all
    data.each { |url_and_buckets| splat_with_url(url_and_buckets) }
  end

  def splat_with_url(blob)
    collect_hits(blob[:url].freeze, blob.dig(:aggs, 'aggregations', 'known_urls', 'buckets'))
  end

  def collect_hits(url, buckets)
    buckets.each do |bucket|
      @flat_results << { date: bucket['key'], url: url, count: bucket['doc_count'] }
    end
  end


  def url_labels
    res = {}
    urls.each_with_index.map do |url, index|
      res["url_#{index}"] = url
    end
    res
  end

  def urls
    res = []
    data.each { |section| res << section[:url] }
    res
  end

  def match_with_labels(flat_hash)
    final_data = []
    date_ranges = flat_hash.map { |x| x[:date] }.uniq
    date_ranges.each do |date|
      before_url_replacement = flat_hash.select { |hash| hash[:date] == date }
      final_data << replace_url_with_label_key(before_url_replacement)
    end
    final_data
  end


  def replace_url_with_label_key(data)
    url_labels.each do | label |
      data.each do | hash |
        if hash[:url] == label[1]
          hash[label[0]] = hash.delete(:count)
          hash.delete(:url)
        end
      end
    end
    flatten_nested_hash_and_remove_dupes(data)
    end

    def flatten_nested_hash_and_remove_dupes(hash)
      # dont' ask how I did this I don't know either
      {}.tap{ |r| hash.each{ |h| h.each{ |k,v| r[k] = v } } }.symbolize_keys
    end


end

