class PagesController < ApplicationController
  def home
  	@title = "Home"
  end

  protected
  def authorize
  	# für pages-controller muss Anwender nicht eingeloggt sein
  end

end