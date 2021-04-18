class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      @user_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:user_order).permit(:prefecture_id, :post_code, :area_city, :area2_address, :area3_building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
