require File.expand_path(File.dirname(__FILE__) + '../../../test_config.rb')

describe "Favorite Model" do
  it 'can construct a new instance' do
    @favorite = Favorite.new
    refute_nil @favorite
  end
  
  it 'saves with a url' do
    @favorite = Favorite.create(url: "myurl")
    assert @favorite.persisted?
  end

  it 'will not save a favorite with a url' do
    @favorite = Favorite.create
    refute_empty @favorite.errors
  end

end
