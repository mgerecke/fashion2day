class PagesController < ApplicationController
  def home
  	@title = "Home"
  end

  def about
  	@title = "Ueber uns"
  end

  def contact
  	@title = "Kontakt"
  end

end