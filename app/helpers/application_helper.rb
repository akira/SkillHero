module ApplicationHelper
  
  def stars_for_rating(rating)
    html = ''
    rating.times do 
      html << image_tag('full_star.png')
    end
    html
  end
end
