class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all
    @items_latest4 = @items.first(4) 
  end

  def about
  end
end
