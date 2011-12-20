require 'iconv'

class AddressesController < ApplicationController

  BOM = "\377\376" #Byte Order Mark

  # GET /addresses
  def index
  	@curselected = params[:spalte] || "1"
  	@lookups = Lookup.all
    @addresses = Address.search(params[:search], params[:spalte]).paginate(:page => params[:page], :per_page => 15)
    	respond_to do |format|
				format.html
    		format.csv { export_csv(@addresses) }
    	end
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
    cuser = User.find(current_user)
    @address.update_user = cuser.name
  end

  # POST /addresses
  def create
    @address = Address.new(params[:address])
    cuser = User.find(current_user)
    @address.update_user = cuser.name
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

  protected

  def export_csv(addresses)

    filename="Adressen_" + Time.now.strftime("%Y-%m-%d-%H%M%S") + ".csv"
    content = FasterCSV.generate(:col_sep => ";") do |csv|
    	csv << [
	    "Firma",
	    "Name",
	    "Vorname",
	    "Position",
	    "Briefkontakt",
	    "Strasse",
	    "Hausnr",
	    "Plz",
	    "Ort",
	    "Land",
	    "Phone",
	    "Fax",
	    "Email",
	    "Web",
	    "Kategory",
	    "Subkategorie"
    	]
    	addresses.each do |address|
	      csv << [
	      address.firma,
	      address.vorname,
	      address.nachname,
	      address.position,
	      address.briefkontakt,
	      address.strasse,
	      address.hausnr,
	      address.plz,
	      address.ort,
	      address.land,
	      address.fon,
	      address.fax,
	      address.email,
	      address.web,
	      address.category.name,
	      address.subcategory.name
	      ]
	    	end
  	end
	  content = BOM + Iconv.conv("utf-16le", "utf-8", content)
	  send_data content, :type => 'text/csv; header=present', :filename => filename
    flash.now[:notice] = "Adressen wurden gesendet!"
	  end
end