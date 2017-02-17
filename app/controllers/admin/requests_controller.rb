class Admin::RequestsController < ApplicationController
  before_action :load_shop, only: [:update, :destroy]
  layout "admin_layout"

  def index
    @supports = Supports::RequestSupport.new params[:page]
  end

  def update
    @shop.update status: params[:value]
    if @shop.save
      flash[:success] = t "success"
    else
      flash[:danger] = t "not_success"
    end
    redirect_to :back
  end

  private
  def load_shop
    @shop = Shop.find_by id: params[:id]
    unless @shop
      flash[:success] = t "shop_not_found"
      redirect_to :back
    end
  end
end
