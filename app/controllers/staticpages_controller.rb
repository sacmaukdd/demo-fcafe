class StaticpagesController < ApplicationController
  def index
    @shop_types = ShopType.paginate page: params[:page],
      per_page: Settings.staticpages.per_page
    if params[:id]
      @shop_type = @shop_types.find_by id: params[:id]
      unless @shop_type
        flash[:danger] = t "shop_type_not_found"
      end
      @shops = @shop_type.shops.paginate page: params[:page],
        per_page: Settings.staticpages.per_page
    else
      @shops = Shop.approved.paginate page: params[:page],
        per_page: Settings.staticpages.per_page
    end
  end
end
