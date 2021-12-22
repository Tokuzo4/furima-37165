class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order_history_address = OrderHistoryAddress.new
    redirect_to root_path if @items.user.id == current_user.id || @items.orders_history.present?
  end

  def create
    @order_history_address = OrderHistoryAddress.new(order_params)
    if @order_history_address.valid?
      @order_history_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_history_address).permit(:postal_code, :prefecture_id, :city, :chome_address, :building_name, :telephone_number).merge(
      user_id: current_user.id, items_id: params[:items_id]
    )
  end
end
