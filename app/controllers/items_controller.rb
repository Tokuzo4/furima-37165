class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @items = Item.all
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

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :price, :postage_id, :shipping_area_id,
                                 :days_to_ship_id, :image).merge(user_id: current_user.id)
  end
end
