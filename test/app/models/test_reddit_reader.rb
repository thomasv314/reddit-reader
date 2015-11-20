require File.expand_path(File.dirname(__FILE__) + '../../../test_config.rb')

describe RedditReader do
  
  it "reads an rss feed from reddit" do
    feed = RedditReader.new.read
    refute_nil feed
    refute_equal false, feed
  end

  it "returns false if a feed error occurs" do
    feed = RedditReader.new(".xml.json.wat.this.won't.work").read
    assert_equal false, feed
  end

end
