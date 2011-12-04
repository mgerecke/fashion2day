class ApplicationController < ActionController::Base

  before_filter :authorize, :except => [:login, :create]

  protect_from_forgery
  include SessionsHelper

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  protected
  def authorize
    unless !session[:remember_token].nil?
      flash[:notice]= "Bitte melden Sie sich an!"
      redirect_to login_path
    end
  end

end