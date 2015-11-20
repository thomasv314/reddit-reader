require File.expand_path(File.dirname(__FILE__) + '../../../test_config.rb')

describe "homepage" do
  before do
    get "/"
  end

  it "should return 200" do
    assert_equal 200, last_response.status
  end
end

describe "favorites" do
  it "should return 200 when you GET /favorites" do
    get "/favorites" 
    assert_equal 200, last_response.status
  end
  
  it "should redirect with status 301 if it saves model" do
    post "/favorite", { url: "url", title: "title" }
    assert_equal 301, last_response.status
  end
  
  it "should redirect with status 422 if it fails to save model" do
    post "/favorite"
    puts last_response.body
    assert_equal 422, last_response.status
  end

end

