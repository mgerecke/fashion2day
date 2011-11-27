class PagesController < ApplicationController
  def home
  	@title = "Home"
  end

  def about
  	@title = "&Uuml;ber uns"
  end

  def contact
  	@title = "Kontakt"
  end

end