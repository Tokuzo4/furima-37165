class OrdersController < ApplicationController

  def index
    @items = Item.find(params[:item_id])
  end

  def create
    @items = Item.new(order_params)
    if @items.valid?
      @items.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:price).merge(token: params[:token])
    # params.require(:address).permit(:name, :postal_code, :prefecture_id, :city, :chome_address, :building_name, :telephone_number)
  end

end