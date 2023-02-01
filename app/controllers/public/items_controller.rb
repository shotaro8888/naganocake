class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @items = Item.all
    @items_latest8 = @items.first(8)
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items
    end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

private

  def item_params
    params.require(:address).permit(:name, :price, :is_active, :genre_id)
  end

end
