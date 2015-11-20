require 'open-uri'
require 'feedjira'

# Make sure we can access OEmbed params in Reddit RSS
Feedjira::Feed.add_common_feed_element('image')
Feedjira::Feed.add_common_feed_entry_element('media:thumbnail', as: :media_thumbnail, value: :url)
Feedjira::Feed.add_common_feed_entry_element('media:title', as: :media_title)

# Initialized with a subreddit name, or nil (which loads the homepage)
class RedditReader
  
  BASE_URL = "https://www.reddit.com/"
 
  # @param reddit_resource [String] the rss feed you'd like to access on Reddit.com 
  # reddit_resource should be nil for homepage
  # reddit_resource should be r/NameOfSubReddit for a subreddit
  # reddit_resource should be u/NameOfUser for a user
  def initialize(reddit_resource = nil)
    if reddit_resource.nil?
      @url = BASE_URL + ".rss"
    else
      @url = BASE_URL + reddit_resource + ".rss"
    end    
  end

  # Returns an RSS feed 
  def read
    Feedjira::Feed.fetch_and_parse(@url)
  end

end
