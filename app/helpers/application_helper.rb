module ApplicationHelper

  #return a title on a per-page basis
  def title
  	base_title = "Fashion Today - Interner Mitarbeiterbereich"
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

  def german_time(datetime)
    datetime.strftime("%d.%m.%y %H:%M:%S")
  end

  def german_date(date)
    date.strftime("%d.%m.%y")
  end

  def german_date_long(date)
    date.strftime("%d.%m.%Y")
  end
end