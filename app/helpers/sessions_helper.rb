module SessionsHelper
  include ApplicationHelper

  def sign_in(user)
  	reset_session
  	session[:remember_token] = user.id

    #Suchwerte für Adress-Maske initialisieren
    session[:spalte] = "1" 		#Suche nach Email
    session[:search] = ""     #Suchbegriff
    session[:sort] = "Firma"  #Default-Sortierung nach Firma
  end

  def sign_out
     user = User.find(session[:remember_token])
     user.last_visit = Time.now().to_s
     user.save
     session[:remember_token] = nil
     current_user = nil
  end

  def current_user
  	@current_user ||= user_from_remember_token
  end

  def signed_in?
  	!session[:remember_token].nil?
	end

  def get_last_visit(last_visit)
     return "Dies ist ihr erster Besuch!" if last_visit.nil?
     return "Der letzte Besuch war am #{german_time(last_visit)}."
  end

  protected

  def user_from_remember_token
		return nil if session[:remember_token].nil?
    user = User.find(session[:remember_token])
	end

end