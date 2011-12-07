class SubcategoriesController < ApplicationController
	before_filter :admin_user, :only => [:new, :create, :edit, :update, :destroy]

  # GET /subcategories
  # GET /subcategories.json
  def index
    #@subcategories = Subcategory.find_by_category_id(params[:id])
    @subcategories = Subcategory.all
  end

  # GET /subcategories/1
  def show
		@category = Category.find(params[:id])
    @subcategories = Subcategory.find_all_by_category_id(params[:id])
  end

  # GET /subcategories/new
  def new
    @subcategory = Subcategory.new
  end

  # GET /subcategories/1/edit
  def edit
		@subcategory = Subcategory.find(params[:id])
  end

  # POST /subcategories
  # POST /subcategories.json
  def create
    @subcategory = Subcategory.new(params[:subcategory])

      if @subcategory.save
				flash[:success] = "Subkategorie wurde gespeichert."
        redirect_to subcategory_path(@subcategory.category_id)
      else
        render "new"
      end
  end

  # PUT /subcategories/1
  def update
    @subcategory = Subcategory.find(params[:id])

    if @subcategory.update_attributes(params[:subcategory])
			flash[:success] = "Subkategorie wurde geaendert."
	    redirect_to @category
    else
    	render :action => "edit"
    end
  end

  # DELETE /subcategories/1
  def destroy
    @subcategory = Subcategory.find(params[:id])
     if @subcategory.destroy
		 		flash[:success] = "Subkategorie wurde geloescht."
    		redirect_to subcategory_path(@subcategory.category_id)
  		end
  end

  private

  def admin_user
     redirect_to root_path unless current_user.admin?
  end

end