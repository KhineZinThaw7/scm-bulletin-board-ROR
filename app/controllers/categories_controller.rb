class CategoriesController < ApplicationController
  layout 'admin/admin'
  before_action :authorized

  def index
    @categories = CategoriesService.categoryList
  end

  def new
    @category = Category.new
  end

  def create
    @category = CategoriesService.createCategory(category_params)
    if @category.save
      flash[:notice] = "Category successfully created"
      redirect_to '/categories'
    else
      render :new
    end
  end

  def edit
    @category = CategoriesService.editCategory(params[:id])
  end

  def update
    @category = CategoriesService.updateCategory(params[:id], category_params)
    if @category.update(category_params)
      flash[:notice] = "Category successfully updated"
      redirect_to '/categories'
    else
      render :new
    end
  end

  def show
    @category = CategoriesService.categoryDetail(params[:id])
  end

  def destroy
    isDeleteCategory = CategoriesService.destroyCategory(params[:id])
    if isDeleteCategory
      flash[:notice] = "Category successfully deleted"
      redirect_to '/categories'
    else
      render :delete
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
