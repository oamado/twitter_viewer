class TwitterAPI
  def search(query)
    tweets = client.search(query, result_type: "recent").take(20)

    result = []

    tweets.each do |tweet|
      result << {text: tweet.full_text,
                 uri: tweet.uri.to_s,
                 favs: tweet.favorite_count,
                 retweets: tweet.retweet_count,
                 date: tweet.created_at
              }
    end

    result
  end

  private

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key    =  ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret =  ENV["TWITTER_CONSUMER_SECRET"]
    end
  end
end