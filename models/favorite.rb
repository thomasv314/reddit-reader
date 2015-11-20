class Favorite < ActiveRecord::Base

  def media_thumbnail
    image_url
  end
  
  def media_title
    title
  end

  def categories
    []
  end
  
  def published
    DateTime.now
  end

end
