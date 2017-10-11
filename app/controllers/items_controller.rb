class ItemsController < ApplicationController
  def index
    @items = Item.available_items
  end

  def show
    @item = Item.find_by(id: params[:id])
  end
end
