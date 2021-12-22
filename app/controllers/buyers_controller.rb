class BuyersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @buyer_address = BuyersAddress.new
  end

  def create
    @buyer_address = BuyersAddress.new(buyer_params)
    if @buyer_address.valid?
      @buyer_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def donation_params
    params.require(:buyer_address).permit(:postal_code, :prefecture, :city, :chome_address, :building_name,
                                          :price).merge(user_id: current_user.id)
  end
end
