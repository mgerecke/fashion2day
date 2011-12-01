module ApplicationHelper
	#return a title on a per-page basis
  def title
  	base_title = "men's fashion today"
    if @title.nil?
    	base_title
    else
    	"#{base_title} - #{@title}"
    end
  end

  # logo generieren mit route => /
  def logo
  	logo = image_tag("logo.png", :alt => "mens fashion today", :class => "round")
  end

  # facebook-link generieren /
  def facebook
  	facebook = image_tag("facebook.jpg", :alt => "Besuchen Sie uns auf facebook")
  end
end