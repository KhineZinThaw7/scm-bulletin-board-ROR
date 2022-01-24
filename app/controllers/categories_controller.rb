class CategoriesController < ApplicationController
  layout 'admin/admin'
  before_action :authorized

  # category list
  def index
    @categories = CategoriesService.categoryList
  end

  # new category form
  def new
    @category = Category.new
  end

  # create category
  def create
    @category = CategoriesService.createCategory(category_params)
    if @category.save
      flash[:notice] = "Category successfully created"
      redirect_to '/categories'
    else
      render :new
    end
  end

  # edit category form
  def edit
    @category = CategoriesService.editCategory(params[:id])
  end

  # update category
  def update
    @category = CategoriesService.updateCategory(params[:id], category_params)
    if @category.update(category_params)
      flash[:notice] = "Category successfully updated"
      redirect_to '/categories'
    else
      render :new
    end
  end

  # category detail
  def show
    @category = CategoriesService.categoryDetail(params[:id])
  end

  # delete category
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

  # parameters from request
  def category_params
    params.require(:category).permit(:name)
  end
end
