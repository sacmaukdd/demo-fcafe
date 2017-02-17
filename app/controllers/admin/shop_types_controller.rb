class Admin::ShopTypesController < ApplicationController
  before_action :load_shop_type, only: [:edit, :update, :destroy]
  layout "admin_layout"

  def index
    @shop_types = ShopType.order_date_desc.paginate page: params[:page],
      per_page: Settings.per_page
    @shop_type = ShopType.new
  end

  def create
    was_created = false
    @shop_type = ShopType.find_or_create_by shop_type_params do
      was_created = true
    end
    if was_created
      flash[:success] = t "create_complete"
    else
      flash[:danger] = t "shop_type_exist"
    end
    redirect_to :back
  end

  def edit
  end

  def update
    if @shop_type.update_attributes shop_type_params
      flash[:success] = t "shop_type_updated"
      redirect_to admin_shop_types_path
    else
      render :edit
    end
  end

  def destroy
    if @shop_type.destroy
      flash[:success] = t "del_complete"
    else
      flash[:danger] = t "not_delete"
    end
    redirect_to :back
  end

  private
  def shop_type_params
    params.require(:shop_type).permit :name
  end

  def load_shop_type
    @shop_type = ShopType.find_by id: params[:id]
    unless @shop_type
      flash[:danger] = t "shop_type_not_found"
      redirect_to :back
    end
  end
end
