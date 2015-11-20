require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

describe "Favorite Model" do
  it 'can construct a new instance' do
    @favorite = Favorite.new
    refute_nil @favorite
  end
end
