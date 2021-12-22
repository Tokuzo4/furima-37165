class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :set_items, except: [:index, :new, :create]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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
    if @items.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @items.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :price, :postage_id, :prefecture_id,
                                 :days_to_ship_id, :image).merge(user_id: current_user.id)
  end

  def set_items
    @items = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @items.user
  end
end