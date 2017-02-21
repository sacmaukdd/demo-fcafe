class ShopOwner::ShopsController < ApplicationController
  layout "shop_owner_layout"

  load_and_authorize_resource

  def index
    @shops = Shop.order_date_desc.shop_by_user(current_user.id).approved
      .paginate page: params[:page], per_page: Settings.per_page
  end

  def edit
    @shop_types = ShopType.all
  end

  def update
    if @shop.update_attributes shop_params
      flash[:success] = t "shop_updated"
      redirect_to shop_owner_shops_path
    else
      render :edit
    end
  end

  def destroy
    if @shop.destroy
      flash[:success] = t "del_complete"
    else
      flash[:danger] = t "not_delete"
    end
    redirect_to shop_owner_shops_path
  end

  private
  def shop_params
    params.require(:shop).permit :name, :description, :address, :user_id,
      :avatar, :shop_type_id
  end
end
