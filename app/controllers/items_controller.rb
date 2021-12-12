class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
  Item.create(item_params)
end

def edit
end

private
def item_params
  params.require(:item).permit(:name, :explanatation,)
end

def message_params
  params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
end

end
