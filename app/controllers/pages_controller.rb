class PagesController < ApplicationController
  def home
  	@title = "Home"
  end

  protected
  def authorize
  	# f�r pages-controller muss Anwender nicht eingeloggt sein
  end

end