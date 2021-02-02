class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy_form = BuyForm.new
  end

  def create
    @buy_form = BuyForm.new(order_params)
    @item = Item.find(params[:item_id])
    if @buy_form.valid?
      @buy_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def order_params
    params.permit(:item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id)
  end
end
