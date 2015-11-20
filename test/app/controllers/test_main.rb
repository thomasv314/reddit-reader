require File.expand_path(File.dirname(__FILE__) + '../../../test_config.rb')

describe "homepage" do
  before do
    get "/"
  end

  it "should return 200" do
    assert_equal 200, last_response.status
  end
end
