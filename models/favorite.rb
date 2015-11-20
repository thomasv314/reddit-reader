class Favorite < ActiveRecord::Base

  validates_presence_of :url

  def media_thumbnail
    image_url
  end
  
  def media_title
    title
  end

  def published
    posted
  end

end
