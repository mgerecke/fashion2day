class UsersController < ApplicationController

  def index
		@title = "Anwender-Liste"
    @user = User.find(:all)
  end

  def new
  	@title = "Neuer Anwender"
  end

  def create
     @user = User.create(params[:user])
     if @user.save
     	flash.now[:success] ="Anwender wurde gespeichert!"
      redirect_to :index
     else
     	render 'new'
     end
  end

  def show
     @user = User.find(params[:id])
  end

end