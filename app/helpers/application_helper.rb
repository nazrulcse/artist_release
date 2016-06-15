module ApplicationHelper
  def track_icon(artist)
    if artist.category.present?
      category = artist.category.name.downcase
      if category == 'music'
        klasss = 'fa-music'
      elsif category == 'models'
        klasss = 'fa-film'
      else
        klasss = 'fa-book'
      end
      raw "<i class='fa #{klasss}' style='font-size: 12px;'></i>"
    end
  end

  def facebook_likes(page_url)
    fql = "SELECT url, share_count, like_count, comment_count, total_count FROM link_stat WHERE url='#{page_url}'"
    uri = URI("https://api.facebook.com/method/fql.query?format=json&query=#{URI::encode(fql)}")
    data = Net::HTTP.get(uri)
    likes = JSON.parse(data)
    if likes.present?
      likes[0]['like_count']
    else
      likes.inspect
    end
  end

end
