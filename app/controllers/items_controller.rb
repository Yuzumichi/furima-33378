class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :item_find, only:[:show, :edit, :update]
  before_action :move_to_root, only: [:edit, :update]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  
  private
  def item_params
    params.require(:item).permit(:name, :price, :explanation, :status_id, :category_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def move_to_root
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

end
