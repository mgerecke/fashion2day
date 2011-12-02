class SessionsController < ApplicationController

  def new
  	@title = "Login"
  end

  def create
  	flash.now[:success] = "willkommen, Luke Skywalker!"
    render :new

  end

  def destroy

  end

end