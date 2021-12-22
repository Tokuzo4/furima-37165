class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  def index
    redirect_to root_path if current_user.id == @item.user.id || @item.order_history.present?
    @order_history_address = OrderHistoryAddress.new
  end

  def create
    @order_history_address = OrderHistoryAddress.new(order_history_params)
    if @order_history_address.valid?
      @order_history_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private


  def order_history_params
    params.require(:order_history_address).permit(:postal_code, :prefecture_id, :city, :chome_address, :building_name, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
