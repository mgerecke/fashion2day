class SessionsController < ApplicationController

  def login
    @title = "Login"
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Email/Passwort Kombination unbekannt!"
      @title = "Login"
      render 'new'
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
     @last_visit = show_last_visit(@user.last_visit)
  end

end