class AddressesController < ApplicationController
  # GET /addresses
  def index
  	@curselected = params[:spalte] || "1"
  	@lookups = Lookup.all
    @addresses = Address.search(params[:search], params[:spalte])
  end


  # GET /addresses/1
  def show
    @address = Address.find(params[:id])
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
    @address = Address.find(params[:id])
    user = User.find(current_user)
  end

  # POST /addresses
  def create
    @address = Address.new(params[:address])
      if @address.save
         flash[:success] = "Adresse wurde angelegt!"
         redirect_to addresses_path
      else
        render 'new'
      end
  end

  # PUT /addresses/1
  def update
    @address = Address.find(params[:id])
    cuser = User.find(current_user)
    @address.update_user = cuser.name
    	if @address.update_attributes(params[:address])
        flash[:notice] = "Adresse wurde geaendert!"
        redirect_to addresses_path
      else
         render 'edit'
      end
  end

  # DELETE /addresses/1
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:notice] = "Adresse wurde geloescht!"
    redirect_to addresses_path
  end
end