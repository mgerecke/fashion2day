class SessionsController < ApplicationController

  def login
    @title = "Login"
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash[:error] = "Email/Passwort Kombination unbekannt!"
      @title = "Login"
      redirect_to login_path
    else
      flash.now[:success] = "Hallo, #{user.name}!"
			@title = "Willkommen"
      sign_in user
      redirect_to welcome_path
    end

  end

  def destroy
      sign_out
      flash[:success] = "Sie wurden erfolgreich abgemeldet!"
      redirect_to root_path
  end

  def welcome
     @user = User.find(session[:remember_token])
  end

end