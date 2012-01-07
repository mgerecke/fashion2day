class CategoriesController < ApplicationController

  include ApplicationHelper
	before_filter :admin_user

  # GET /categories
  def index
    @categories = Category.find(:all, :order => 'name').paginate(:page => params[:page], :per_page => 10)
  end

  # GET /categories/1
  def show
    @category = Category.find(params[:id])
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  def create
    @category = Category.new(params[:category])
      if @category.save
        flash[:succes] = "Kategorie wurde angelegt."
        redirect_to categories_path
      else
        render "new"
      end
  end

  # PUT /categories/1
  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
        flash[:success] = "Kategorie wurde geandert."
        redirect_to categories_path
    else
        render "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
			 flash[:success] = "Kategorie wurde geloescht!"
			redirect_to categories_url
    end
  end
end