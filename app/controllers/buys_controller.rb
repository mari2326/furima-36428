class BuysController < ApplicationController

  def index
    @buy_address = BuyAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    @item = Item.find(params[:item_id])
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:post_code, :prefecture_id, :municipality, :street_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])  
  end
end
