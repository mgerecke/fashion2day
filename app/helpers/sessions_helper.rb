module SessionsHelper

  def sign_in(user)
  	session[:remember_token] = user.id
  end

  def sign_out
     user = User.find(session[:remember_token])
     user.last_visit = Time.now().to_s
     user.save
     session[:remember_token] = nil
  end

  def current_user
  	@current_user ||= user_from_remember_token
  end

  def signed_in?
  	!session[:remember_token].nil?
	end

  def show_last_visit(last_visit)
     return "Dies ist ihr erster Besuch!" if last_visit.nil?
     return "Der letzte Besuch war am #{last_visit}."
  end

  private

  #def current_user=(user)
  #	@current_user = user
  #end

  def user_from_remember_token
		return nil if session[:remember_token].nil?
    user = User.find(session[:remember_token])
	end

end