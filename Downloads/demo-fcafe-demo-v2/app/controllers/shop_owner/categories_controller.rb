class ShopOwner::CategoriesController < ApplicationController
  layout "shop_owner_layout"
  
  load_and_authorize_resource

  before_action :load_list_category, only: [:new, :edit]
  
  def index
    params[:shop_id] ||= current_user.shops.first.id
    @categories = Category.by_shop(params[:shop_id]).newest
      .paginate page: params[:page], per_page: Settings.categories.per_page
  end

  def new
    @category = Category.new
  end

  def create
    @parent_category = Category.find_by id: category_params[:parent_id]
    if @parent_category && @parent_category.products.any?
      flash[:danger] = t(".relationship_error", name: @parent_category.name,
        num_product: @parent_category.products.size)
    else 
      @category = Category.find_or_create_by category_params 
      if @category.save
        flash[:success] = t ".create_success"
      else
        flash[:danger] = t ".category_existed"
      end
    end
    redirect_to shop_owner_categories_path
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".update_success"
      redirect_to shop_owner_categories_path
    else
      flash[:danger] = t ".update_error"
      render :edit
    end
  end

  def destroy
    if @category.leaf? 
      if @category.destroy
        flash[:success] = t ".delete_success"
      else
        flash[:danger] = t ".delete_error"
      end
    else 
      flash[:danger] = t ".relationship_error"
    end
    redirect_to shop_owner_categories_path
  end

  private
  def category_params
    params.require(:category).permit :name, :parent_id, :shop_id
  end

  def load_list_category
    @categories = Category.all
    unless @categories
      flash[:danger] = t ".not_found"
      redirect_to shop_owner_categories_path
    end
  end
end
