class UsersController < ApplicationController

  include ApplicationHelper
	before_filter :admin_user

  def index
		@title = "Anwender-Liste"
    @users = User.find(:all)
  end

  def new
  	@title = "Neuer Anwender"
    @user = User.new
  end

  def create
     @user = User.create(params[:user])
     if @user.save
     	flash[:success] ="Anwender wurde gespeichert!"
      redirect_to(users_path)
     else
     	render 'new'
     end
  end

  def edit
  	@title = "Anwender bearbeiten"
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
    	flash[:success] ="Anwenderdaten wurden geaendert!"
      redirect_to(users_path)
    else
    	@title = "Anwender bearbeiten"
      render 'edit'
    end
  end


  def destroy
    user = User.find(params[:id])
    	if not_current_user(user)
	    	User.find(user).destroy
    		flash[:success] ="Anwenderdaten wurden geloescht!"
    		redirect_to users_path
      else
        flash[:error] ="Dieser Vorgang ist nicht erlaubt!"
				redirect_to users_path
      end
  end

  private

  def not_current_user(user)
      current_user != user ? true : false
  end
end