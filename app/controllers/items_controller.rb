class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)

  
  private
  def item_params
    params.require(:item).permit(:name, :price, :explanation, :status_id, :category_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end

end
