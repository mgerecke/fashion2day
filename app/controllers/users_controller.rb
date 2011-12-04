class UsersController < ApplicationController

  before_filter :admin_user, :only => [:new, :create, :edit, :update, :destroy]

  def index
		@title = "Anwender-Liste"
    @users = User.find(:all)
  end

  def new
  	@title = "Neuer Anwender"
    @user = User.create
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
    user = User.find(params[:id]).destroy
    flash[:success] ="Anwenderdaten wurden geloescht!"
    redirect_to users_path
  end

  private

  def admin_user
     redirect_to root_path unless current_user.admin?
  end
end