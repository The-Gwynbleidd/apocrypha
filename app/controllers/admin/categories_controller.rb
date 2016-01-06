class Admin::CategoriesController < Admin::ApplicationController
  before_action :set_category, only:[:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category has been created."
      redirect_to @category
    else
      flash.now[:alert] = "Category has not been created."
      render "new"
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category has been updated."
      redirect_to admin_category_path(@category)
    else
      flash[:alert] = "Category has not been updated."
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = "Category has been deleted."
    redirect_to admin_categories_path
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end

    def set_category
      @category = Category.friendly.find(params[:id])
    end
end
