class ShopOwner::AlbumsController < ApplicationController
  layout "shop_owner_layout"
  before_action :load_album, only: [:edit, :update, :destroy]

  def index
    @album = Album.new
    @albums = Album.order_date_desc.album_by_shop(params[:id])
      .paginate page: params[:page], per_page: Settings.per_page
    @shop_id = params[:id]
  end

  def create
    @album = Album.new album_params
    if @album.save
      flash[:success] = t "create_complete"
    else
      flash[:danger] = t "not_create"
    end
    redirect_to :back
  end

  def edit
    @edit_page = params[:action]
  end

  def update
    if @album.update_attributes album_params
      flash[:success] = t "album_updated"
    else
      flash[:danger] = t "album_not_update"
    end
    redirect_to shop_owner_albums_path(id: @album.shop_id)
  end

  def destroy
    if @album.destroy
      flash[:success] = t "del_complete"
    else
      flash[:danger] = t "not_delete"
    end
    redirect_to :back
  end

  private
  def album_params
    params.require(:album).permit :name, :shop_id
  end

  def load_album
    @album = Album.find_by id: params[:id]
    unless @album
      flash[:danger] = t "album_not_found"
    end
  end
end
