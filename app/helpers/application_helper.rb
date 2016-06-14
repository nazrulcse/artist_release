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
end
