module Reddit
  class App < Padrino::Application
    register ScssInitializer
    register Padrino::Mailer
    register Padrino::Helpers

    use ConnectionPoolManagement
    
    enable :sessions

    get "/" do
      @feed = RedditReader.new.read
      if @feed
        load_existing_favorites 
        haml :reddit
      else
        haml :feed_error
      end
    end

    get "/r/:subreddit" do
      @current_category = params[:subreddit] 
      @feed = RedditReader.new("/r/#{@current_category}").read
      if @feed 
        load_existing_favorites  
        haml :reddit
      else
        haml :feed_error
      end
    end

    get "/favorites" do
      @favorites = Favorite.all
      @existing_favorites = @favorites.map { |f| f.url }
      haml :favorites
    end

    post "/favorite" do
      @favorite = Favorite.find_by_url(favorite_params["url"]) 
      if @favorite.nil?
        @favorite = Favorite.create(favorite_params)
        session[:flash] = "Favorited #{favorite_params["title"]}"
        redirect request.referrer
      else
        @favorite.destroy
        session[:flash] = "Unfavorited #{favorite_params["title"]}"
        redirect request.referrer
      end
    end

    protected
    # Very basic version of strong params 
    def favorite_params
      allowed_params = [ "title", "url", "image_url", "posted", "category"]
      @favorite_params ||= params.select { |k, v| allowed_params.include? k }
    end

    # Returns an array of urls which we've already favorited
    def load_existing_favorites
      # Get an array of urls from the feed 
      urls = @feed.entries.map { |e| e.url }
      @existing_favorites = Favorite.where(url: urls).pluck(:url).uniq
    end

  end
end
