class BuysController < ApplicationController

  def index
    @buy_address = BuyAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buy_address = BuyAddress.new(buyaddress_params)
    @item = Item.find(params[:item_id])
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyaddress_params
    params.require(:buy_address).permit(:post_code, :prefecture_id, :municipality, :street_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])  
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,
      card: buyaddress_params[:token],  
      currency: 'jpy'       
    )
  end
end
