class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @items = Item.all
  end

  def show
    @genres = Genre.all
    @items = Item.all
    @item = Item.find(params[:id])
    @cart_item = Cart_item.new
  end

private

  def item_params
    params.require(:address).permit(:name, :price, :is_active, :genre_id)
  end

end
